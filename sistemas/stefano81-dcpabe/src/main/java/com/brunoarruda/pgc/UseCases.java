package com.brunoarruda.pgc;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.ObjectInputStream;
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
					System.out.println("running: " + m.getName());
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
		File root_test_path = new File(TEST_PATH);
		root_test_path.mkdir();		
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
	
	public static void testBasicUserCreation(String testPath) {
		
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
			DCPABETool.main(args);
		}
	}
	
	public static void testCanDecodeBinaryFiles(String testPath) {
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
			DCPABETool.main(args);
		}
		String[] binaryPaths = {globalSetupPath, authoritySecretKeyPath, authorityPublicKeyPath, pacientKeyPath, encryptedFilePath};
		try {
			for (String path : binaryPaths) {
				ObjectInputStream ois = new ObjectInputStream(new FileInputStream(path));
				BufferedWriter writer = new BufferedWriter(new FileWriter(path + "ClearText"));
				writer.write(ois.readObject().toString());
				writer.close();
			}
		} catch (Exception e) {
			throw new Error("could not open " + globalSetupPath);
		} finally {
			
		}
		
		System.out.println();
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
