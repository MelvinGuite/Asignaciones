package com.encriptado;

import org.jasypt.util.password.StrongPasswordEncryptor;

public class Procesamiento {
	
	private static final StrongPasswordEncryptor psw = new StrongPasswordEncryptor();
	
	public String Encriptar (String pass) {
		return psw.encryptPassword(pass);
	}
	
	public boolean Verificar ( String pass, String hash ) {
		return psw.checkPassword(pass, hash);
	}
}
