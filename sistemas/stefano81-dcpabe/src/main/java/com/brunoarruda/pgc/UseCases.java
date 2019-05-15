package com.brunoarruda.pgc;

import java.io.File;
import java.lang.reflect.Method;
import sg.edu.ntu.sce.sands.crypto.DCPABETool;

public class UseCases {

	final static String DATA_PATH = "data";
	final static String TEST_PATH = DATA_PATH + File.separator + "test";
	static boolean enablePersist = false;
	
	public static void main(String[] args) {
		if (args.length > 0 && args[0].equals("persist")) {
			enablePersist = true;
		}
		
		Method[] methods = UseCases.class.getDeclaredMethods();
		for (Method m : methods) {
			String test_path = TEST_PATH + File.separator + m.getName();
			if (m.getName().startsWith("test")) {
				setupTest(test_path);
				try {
					m.invoke(null, test_path);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if (!enablePersist) {
					tearDown(test_path);
				}
			}
		}
	}
	
	private static void setupTest(String testPath) {
		File path = new File(testPath);
		path.mkdir();
	}
	
	private static void tearDown(String testPath) {
		File path = new File(testPath);		
		for (File file : path.listFiles()) {
			file.delete();
		}
		path.delete();
	}
	
	private static void testBasicUserCreation(String testPath) {
		
		String authorityName = "CertifyingAuthority";
		String pacientName = "Bob";
		String fileName = "medicalRecording.txt";
		
		String globalSetupPath = testPath + File.separator + "globalSetup";
		String authoritySecretKeyPath = testPath + File.separator + authorityName + "SecretKey";
		String authorityPublicKeyPath = testPath + File.separator + authorityName + "PublicKey";
		String pacientKeyPath = testPath + File.separator + "Key" + pacientName;
		String filePath = DATA_PATH + File.separator + fileName ;
		String encryptedFilePath = testPath + File.separator + "enc_" + fileName;
		String decryptedFilePath = testPath + File.separator + "dec_" + fileName;
		
		String[][] commands = {
				{"gsetup", globalSetupPath},
				{"asetup", authorityName,  globalSetupPath, authoritySecretKeyPath, authorityPublicKeyPath,
					"medico", "dono_do_prontuario", "paciente"},
				{"keyGen", pacientName, "dono_do_prontuario", 
					globalSetupPath, authoritySecretKeyPath, pacientKeyPath },
				{"enc", filePath, "dono_do_prontuario OR medico", encryptedFilePath, 
						globalSetupPath, authorityPublicKeyPath},
				{"dec", pacientName, encryptedFilePath, decryptedFilePath, globalSetupPath, 
							pacientKeyPath}
		};

		for (String[] args : commands) {
			System.out.println(String.join(" ", args));
			DCPABETool.main(args);
		}				
	}

	private static void testBasicUserEncrypt() {
		// test encryption with a basic user
	}

	private static void testPoliticWithMultipleAttributes() {

	}

	private static void testDecryptOnlyWithCorrectSetOfAttributes() {

	}
}
