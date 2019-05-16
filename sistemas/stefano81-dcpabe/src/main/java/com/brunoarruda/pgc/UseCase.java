package com.brunoarruda.pgc;

import java.io.File;
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
		this.authorityPublicFile = authorityName + "PublicKey";
		this.authoritySecretFile = authorityName + "SecretKey";
		this.attributes = attributes;
		this.keyFiles = new String[attributes.length];
	}

	private void runCommand(String[] args) {
		DCPABETool.main(args);
	}

	public String getKeyFilePath(String name) {
		
		for (int i = 0; i < this.keyFiles.length; i++) {
			if (this.keyFiles[i].indexOf(name) != -1) {
				return this.keyFiles[i];
			}
		}
		return null;
	}

	public void globalSetup() {
		String[] args = {"gsetup", this.globalSetup};
		this.runCommand(args);
	}
	
	public void authoritySetup() {
		String[] args = {"asetup", this.authorityName,  this.globalSetup, this.authoritySecretFile,  this.authorityPublicFile};
		List<String> list = new ArrayList(Arrays.asList(args));
		list.addAll(Arrays.asList(this.attributes));
		args = (String[]) list.toArray();
		this.runCommand(args);
	}
	
	public void keyGeneration() {
		for (int i = 0; i < this.attributes.length; i++) {
			String keyFile = testPath + File.separator + "key-" + attributes[i];
			String args[] = {"keyGen", "-", attributes[i], this.globalSetup, this.authoritySecretFile, keyFile};
			this.runCommand(args);
		}
	}
	
	public void encrypt(String filePath, String accessPolicy) {
		String[] path = filePath.split(File.separator);
		String encryptedFile = "";
		for (int i = 0; i < path.length - 1; i++) {
			encryptedFile = encryptedFile + File.separator;
		}
		encryptedFile = encryptedFile + "enc_" + path[path.length - 1];
		String[] args = {"enc", filePath, accessPolicy, encryptedFile, this.globalSetup, this.authorityPublicFile};
		this.runCommand(args);
	}
	
	public void decrypt(String filePath, String userName, String ... keys) {
		String[] path = filePath.split(File.separator);
		String decryptedFile = "";
		for (int i = 0; i < path.length - 1; i++) {
			decryptedFile = decryptedFile + File.separator;
		}
		decryptedFile = decryptedFile + "dec_" + path[path.length - 1];
		String[] args = {"dec", "-", filePath, decryptedFile, this.globalSetup};
		List<String> list = new ArrayList(Arrays.asList(args));
		list.addAll(Arrays.asList(keys));
		args = (String[]) list.toArray();
		this.runCommand(args);
	}
}
