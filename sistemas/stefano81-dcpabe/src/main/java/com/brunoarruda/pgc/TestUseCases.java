package com.brunoarruda.pgc;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import java.util.Stack;

public class TestUseCases {

	/**
	 * if you are opening stefano81-dcpabe as the root project folder on your IDE,
	 * remove the part "sistemas\\stefano81-dcpabe\\" from TEST_PATH
	 * */
	final static String TEST_PATH = "sistemas\\stefano81-dcpabe\\test data";
	final static private PrintStream realSystemOut = System.out;
	final static private PrintStream realSystemErr = System.err;

	public static void main(String[] args) {
		System.out.println("Tests:\n");

		File root_test_path = new File(TEST_PATH);
		root_test_path.mkdir();

		runTestMethods();
	}
	private static class NullOutputStream extends OutputStream {
		@Override
		public void write(int b){
			return;
		}
		@Override
		public void write(byte[] b){
			return;
		}
		@Override
		public void write(byte[] b, int off, int len){
			return;
		}
		public NullOutputStream(){
		}
	}

	private static void runTestMethods() {
		Method[] methods = TestUseCases.class.getDeclaredMethods();
		for (Method m : methods) {
			if (m.getName().startsWith("test")) {
				String testPath = TEST_PATH + File.separator + m.getName();
				try {
					System.out.print(String.format("running: %s ... ", m.getName()));

					// disables output streams from code to not mess the test logging
					System.setOut(new PrintStream(new NullOutputStream()));
					System.setErr(new PrintStream(new NullOutputStream()));

					// invoke the function which name starts with 'test'
					m.invoke(null, testPath);

					// restores the output from System.out
					System.setOut(realSystemOut);
					System.setErr(realSystemErr);
					if (m.getName().contains("shouldFail")) {
						System.out.println("FAILED.");
					} else {
						System.out.println("OK.");
					}
				} catch (Exception e) {
					// restores the output from System.out
					System.setOut(realSystemOut);
					System.setErr(realSystemErr);
					String result = "FAILED.";
					if(m.getName().contains("shouldFail")) {
						result = "OK.";
					}
					String fileDir = testPath + File.separator + "log_error.txt";
					try (PrintWriter pw = new PrintWriter(new FileWriter(fileDir, true))) {
						e.printStackTrace(pw);
					} catch (Exception e1) {
						e1.printStackTrace();
					}
					System.out.println(result + " (check the log on the test folder)");
				}
			}
		}
	}

	public static void testDecrypt_WithOneAttribute(String testPath) {
		String[] names = { "Bob" };
		String[] attributes = { "paciente" };
		String authorityName = "Entidade Certificadora";

		UseCase test = new UseCase(authorityName, testPath, attributes);
		test.globalSetup();
		test.authoritySetup();
		test.keyGeneration(names, attributes);
		test.encrypt("", "paciente");
		String[] keyPath = test.searchKeys(names[0]);
		test.decrypt("", names[0], keyPath);
	}

	public static void testDecrypt_WithTwoAttributes(String testPath) {
		String[] names = { "Bob", "Bob" };
		String[] attributes = {"paciente", "dono-do-prontuário"};
		String authorityName = "Entidade Certificadora";

		UseCase test = new UseCase(authorityName, testPath, attributes);
		test.globalSetup();
		test.authoritySetup();
		test.keyGeneration(names, attributes);
		test.encrypt("", "dono-do-prontuário and paciente");
		test.decrypt("", names[0], test.searchKeys(names[0]));
	}

	public static void testPolicy_AndGateWithMissingAttribute_shouldFail(String testPath) {
		String[] names = { "Bob", "Bob", "Alice" };
		String[] attributes = { "paciente", "dono-do-prontuário", "usuário-credenciado" };
		String authorityName = "Entidade Certificadora";

		UseCase test = new UseCase(authorityName, testPath, attributes);
		test.globalSetup();
		test.authoritySetup();
		test.keyGeneration(names, attributes);
		test.encrypt("", "and usuário-credenciado and dono-do-prontuário paciente");
		test.decrypt("", names[0], test.searchKeys(names[0]));

	}

	public static void testPolicy_OrGateWithMissingAttribute(String testPath) {
		String[] names = { "Bob", "Alice" };
		String[] attributes = { "dono-do-prontuário", "médico" };
		String authorityName = "Entidade Certificadora";

		UseCase test = new UseCase(authorityName, testPath, attributes);
		test.globalSetup();
		test.authoritySetup();
		test.keyGeneration(names, attributes);
		test.encrypt("", "or dono-do-prontuário médico");
		test.decrypt("", names[0], test.searchKeys(names[0]));
	}

	public static void testDecrypt_WithKeyFromOtherUser_shouldFail(String testPath) {
		String[] names = { "Bob", "Mr. Robot" };
		String[] attributes = { "dono-do-prontuário", "hacker" };
		String authorityName = "Entidade Certificadora";

		UseCase test = new UseCase(authorityName, testPath, attributes);
		test.globalSetup();
		test.authoritySetup();
		test.keyGeneration(names, attributes);
		test.encrypt("", "dono-do-prontuário");
		test.decrypt("", names[1], test.searchKeys(names[0]));
	}

	public static void testDecrypt_UserWithOwnAndStolenKeys_shouldFail(String testPath) {
		String[] names = { "Bob", "Alice" };
		String[] attributes = { "paciente", "dono-do-prontuário" };
		String authorityName = "Entidade Certificadora";

		UseCase test = new UseCase(authorityName, testPath, attributes);
		test.globalSetup();
		test.authoritySetup();
		test.keyGeneration(names, attributes);
		test.encrypt("", "paciente and dono-do-prontuário");
		String[] keyPath = { test.searchKeys(names[0])[0], test.searchKeys(names[1])[0] };
		test.decrypt("", names[0], keyPath);
	}

	public static void testEncrypt_WithLargeFile(String testPath) {
		String[] names = { "Bob" };
		String[] attributes = { "paciente" };
		String authorityName = "Entidade Certificadora";

		String fileDir = testPath + File.separator + "BigFile.txt";
		File filePath = new File(fileDir);
		try {
			OutputStreamWriter writer = new OutputStreamWriter(
				new FileOutputStream(filePath), StandardCharsets.UTF_8);
			for (int i = 0; i < 100000; i++) {
				writer.append("This is mock for a Big File sent to encryption with an ABE scheme.\n");
			}
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		UseCase test = new UseCase(authorityName, testPath, attributes);
		test.globalSetup();
		test.authoritySetup();
		test.keyGeneration(names, attributes);

		test.encrypt(fileDir, "paciente");
		String[] keyPath = test.searchKeys(names[0]);
		test.decrypt(fileDir, names[0], keyPath);
	}

	public static void testKeyGen_GenerateKeyWithEmptyName(String testPath) {
		String[] names = {""};
		String[] attributes = {"paciente"};
		String authorityName = "Entidade Certificadora";

		UseCase test = new UseCase(authorityName, testPath, attributes);
		test.globalSetup();
		test.authoritySetup();
		test.keyGeneration(names, attributes);
		test.encrypt("", "paciente");
		String[] keyPath = test.searchKeys(names[0]);
		test.decrypt("", names[0], keyPath);
	}

	public static void testKeyGen_MultipleAttributes(String testPath) {
		String[] names = { "" };
		String[] attributes = { "paciente" };
		String authorityName = "Entidade Certificadora";

		UseCase test = new UseCase(authorityName, testPath, attributes);
		test.globalSetup();
		test.authoritySetup();
		test.keyGeneration(names, attributes);
		test.encrypt("", "paciente");
		String[] keyPath = test.searchKeys(names[0]);
		test.decrypt("", names[0], keyPath);
	}

	// policySize must be a power of 2 in order to make this algorithm work.
	private static String generatePolicy(int policySize, String[] attributes, String[] operators) {
		Stack<String> stack = new Stack<String>();
		for (int i = 0; i < attributes.length; i++) {
			stack.push(attributes[i]);
			int elements = (i + 1);

			while ( elements % 2 == 0) {
				String rightPolicy = stack.pop();
				String leftPolicy = stack.pop();
				int decisor = new Random().nextInt(operators.length);
				String aggregation = String.format("%s %s %s", operators[decisor], leftPolicy, rightPolicy);
				// stack.add((int) log2i - 1, aggregation);
				stack.push(aggregation);
				elements = elements / 2;
			}
		}
		return stack.toString().replace("[", "").replace("]", "");
	}

	public static void testPolicy_HundredsOfOrOperatorsWorks(String testPath) {
		/*
		 * the policy generation algorithm derives a complete binary tree of or, thus
		 * policySize must be a power of 2
		*/
		int policySize = 128;
		String[] names = new String[policySize];
		String[] operators = {"or"};
		String authorityName = "Entidade Certificadora";

		List<String> temp = new ArrayList<String>();
		for (int i = 0; i < names.length; i++) {
			names[i] = "Alice";
		}
		for (int i = 0; i < names.length; i++) {
			temp.add(String.format("attribute-%03d", i));
		}

		String[] attributes = temp.toArray(new String[temp.size()]);
		String bigPolicy = generatePolicy(policySize, attributes, operators);

		UseCase test = new UseCase(authorityName, testPath, attributes);
		test.globalSetup();
		test.authoritySetup();
		test.keyGeneration(names, attributes);
		test.encrypt("", bigPolicy);
		test.decrypt("", names[0], test.searchKeys(names[0]));
	}

	public static void testPolicy_HundredsOfAndOperatorsWorks(String testPath) {
		/*
		 * the policy generation algorithm derives a complete binary tree of or, thus
		 * policySize must be a power of 2
		*/
		int policySize = 128;
		String[] names = new String[policySize];
		String[] operators = {"and"};
		String authorityName = "Entidade Certificadora";

		List<String> temp = new ArrayList<String>();
		for (int i = 0; i < names.length; i++) {
			names[i] = "Alice";
		}
		for (int i = 0; i < names.length; i++) {
			temp.add(String.format("attribute-%03d", i));
		}

		String[] attributes = temp.toArray(new String[temp.size()]);
		String bigPolicy = generatePolicy(policySize, attributes, operators);

		UseCase test = new UseCase(authorityName, testPath, attributes);
		test.globalSetup();
		test.authoritySetup();
		test.keyGeneration(names, attributes);
		test.encrypt("", bigPolicy);
		test.decrypt("", names[0], test.searchKeys(names[0]));
	}
}
