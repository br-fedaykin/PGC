package com.brunoarruda.pgc;

import java.io.File;
import java.lang.reflect.Method;

public class TestUseCases {

	final static String TEST_PATH = "sistemas\\stefano81-dcpabe\\test data";

	public static void main(String[] args) {
		System.out.println("Tests:\n");

		File root_test_path = new File(TEST_PATH);
		root_test_path.mkdir();

		Method[] methods = TestUseCases.class.getDeclaredMethods();
		for (Method m : methods) {
			String test_path = TEST_PATH + File.separator + m.getName();
			if (m.getName().startsWith("test")) {
				try {
					System.out.println("running: " + m.getName());
					m.invoke(null, test_path);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	public static void testBasicUserCreation(String testPath) {
		String[] names = {"Bob"};
		String[] attributes	= {"paciente"};
		String authorityName = "Entidade Certificadora";

		UseCase test = new UseCase(authorityName, testPath, attributes);
		test.globalSetup();
		test.authoritySetup();
		test.keyGeneration(names, attributes);
		test.encrypt("", "paciente");
		String[] keyPath = test.searchKeys(names[0]);
		test.decrypt("", names[0], keyPath);
	}

//	public static void testBasicUserEncrypt() {
//		// test encryption with a basic user
//	}
//
//	public static void testPoliticWithMultipleAttributes() {
//
//	}
//
//	public static void testDecryptOnlyWithCorrectSetOfAttributes() {
//
//	}
}
