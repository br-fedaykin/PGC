package com.brunoarruda.pgc;

import java.io.File;

import sg.edu.ntu.sce.sands.crypto.DCPABETool;

public class UseCases {

	final static String DATA_PATH = "data";
	static String[][] commands = null;
	public static void main(String[] args) {

		testBasicUserCreation();
	}

	private static void testBasicUserCreation() {
		File path = new File(DATA_PATH);
		path.mkdir();
		String[] commands = {
			"gsetup" + DATA_PATH + File.separator + "globalSetup",
			// other commands here
		};

		// TODO: call main method of DCPABETool with commands, spliting the each string into an array.

	}

	private static void testBasicUserEncrypt() {
		// test encryption with a basic user
	}

	private static void testPoliticWithMultipleAttributes() {

	}

	private static void testDecryptOnlyWithCorrectSetOfAttributes() {

	}
}
