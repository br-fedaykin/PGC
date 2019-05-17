package com.brunoarruda.pgc;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import sg.edu.ntu.sce.sands.crypto.DCPABETool;

public class UseCase {
	private String testPath;
	private String globalSetup;
	private String authorityPublicFile;
	private String authoritySecretFile;
	private String authorityName;

	private String[] attributes;
	private String[] keyFiles;

	public UseCase(String authorityName, String testPath, String[] attributes) {
		this.testPath = testPath;
		this.globalSetup = testPath + File.separator + "globalSetup";
		this.authorityName = testPath + File.separator + authorityName;
		this.authorityPublicFile = testPath + File.separator + authorityName.replace(" ", "-") + "-PublicKey";
		this.authoritySecretFile = testPath + File.separator + authorityName.replace(" ", "-") + "-SecretKey";
		this.attributes = attributes;
		this.keyFiles = new String[attributes.length];

		File path = new File(testPath);
		path.mkdir();
	}

	private void runCommand(String[] args) {
		DCPABETool.main(args);
	}

	public String[] searchKeys(String name) {
		List<String> keys = new ArrayList<String>();
		for (int i = 0; i < this.keyFiles.length; i++) {
			if (this.keyFiles[i].indexOf(name) != -1) {
				keys.add(this.keyFiles[i]);
			}
		}
		return keys.toArray(new String[0]);
	}

	public void globalSetup() {
		String[] args = {"gsetup", this.globalSetup};
		this.runCommand(args);
	}

	public void authoritySetup() {
		String[] args = {"asetup", this.authorityName,  this.globalSetup, this.authoritySecretFile,  this.authorityPublicFile};
		List<String> list = new ArrayList<String>(Arrays.asList(args));
		list.addAll(Arrays.asList(this.attributes));
		args = list.toArray(new String[list.size()]);
		this.runCommand(args);
	}

	public void keyGeneration(String[] names, String[] attributes) {
		List<String> keys = new ArrayList<String>();
		if (this.keyFiles[0] != null) {
			keys.addAll(Arrays.asList(this.keyFiles));
		}
		for (int i = 0; i < names.length; i++) {
			String keyFile = testPath + File.separator + String.format("key-%s-%s", names[i], attributes[i]);
			String args[] = {"keyGen", names[i], attributes[i], this.globalSetup, this.authoritySecretFile, keyFile};
			keys.add(keyFile);
			this.runCommand(args);
		}
		this.keyFiles = keys.toArray(new String[keys.size()]);
	}

	public void encrypt(String filePath, String accessPolicy) {
		if (filePath.equals("") || filePath == null) {
			filePath = this.createMockFile();
		}
		String[] path = filePath.split("\\\\");
		String encryptedFile = "";
		for (int i = 0; i < path.length - 1; i++) {
			encryptedFile = encryptedFile + path[i] + File.separator;
		}
		encryptedFile = encryptedFile + "enc_" + path[path.length - 1];
		String[] args = {"enc", filePath, accessPolicy, encryptedFile, this.globalSetup, this.authorityPublicFile};
		this.runCommand(args);
	}

	private String createMockFile() {
		String mockFilePath = this.testPath + File.separator + "mockData.txt";
		File mockFile = new File(mockFilePath);
		if (mockFile.exists()) {
			return mockFilePath;
		}
		try {
			Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(mockFilePath), "UTF8"));
			out.write("This is just a mock data to test simple encryption schemes on ABE.");
			out.close();
		} catch (Exception e) {
			throw new Error("could not write data to " + mockFilePath);
		}
		return mockFilePath;
	}

	public void decrypt(String filePath, String userName, String ... keys) {
		if (filePath.equals("") || filePath == null) {
			filePath = this.createMockFile();
		}
		String[] path = filePath.split("\\\\");
		String decryptedFile = "";
		for (int i = 0; i < path.length - 1; i++) {
			decryptedFile = decryptedFile + path[i] + File.separator;
		}
		filePath = decryptedFile + "enc_" + path[path.length - 1];
		decryptedFile = decryptedFile + "dec_" + path[path.length - 1];
		String[] args = {"dec", userName, filePath, decryptedFile, this.globalSetup};
		List<String> list = new ArrayList(Arrays.asList(args));
		list.addAll(Arrays.asList(keys));
		args = list.toArray(new String[list.size()]);
		this.runCommand(args);
	}
}
