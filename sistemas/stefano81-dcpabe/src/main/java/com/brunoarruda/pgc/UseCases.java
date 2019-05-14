package com.brunoarruda.pgc;

import java.io.File;
import java.util.Arrays;

import sg.edu.ntu.sce.sands.crypto.DCPABETool;

public class UseCases {

	final static String DATA_PATH = "data";
	final static String TEST_PATH = DATA_PATH + File.separator + "test";
	
	public static void main(String[] args) {
		testBasicUserCreation();
	}

	private static void testBasicUserCreation() {
		File path = new File(TEST_PATH);
		path.mkdir();
		String authorityName = "CertifyingAuthority";		
		String pacientName = "Bob";
		String fileName = "medicalRecording.txt";
		
		String globalSetupPath = TEST_PATH + File.separator + "globalSetup";
		String authoritySecretKeyPath = TEST_PATH + File.separator + authorityName + "SecretKey";
		String authorityPublicKeyPath = TEST_PATH + File.separator + authorityName + "PublicKey";
		String pacientKeyPath = TEST_PATH + File.separator + "Key" + pacientName;
		String filePath = DATA_PATH + File.separator + fileName ;
		String encryptedFilePath = TEST_PATH + File.separator + "enc_" + fileName;
		String decryptedFilePath = TEST_PATH + File.separator + "dec_" + fileName;
		
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
