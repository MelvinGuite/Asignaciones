package com.emailservice;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class Soporte {

	public void EnviaCorreo( String motivo, String mensaje, String remitente,  String carnet, String nombre, String apellido) throws UnsupportedEncodingException {
		
	    // Configuración de propiedades para el envío de correo
	    Properties props = new Properties();
	    props.put("mail.smtp.host", "smtp.gmail.com");
	    props.put("mail.smtp.port", "587");
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.starttls.enable", "true");

	    // Inicia una sesión de correo electrónico autenticada utilizando la información de autenticación proporcionada
	    Session session = Session.getInstance(props, new Authenticator() {
	        protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication("melvin.guite.ea@gmail.com", "vcdchqbabsbiutxs");
	        }
	    });

	    try {
	    	String destinatario = "melvin.guite.ea@gmail.com";
	        // Crea un mensaje de correo electrónico
	        Message message = new MimeMessage(session);
	        //configuracion del remitente
	        message.setFrom(new InternetAddress(remitente, "Nombre: " + nombre + " " + apellido + " Carnet: " + carnet));

	        // Agrega el destinatario al mensaje
	        message.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));

	        // Configura el asunto 
	        message.setSubject(motivo);
	        

	        message.setText(mensaje);

	        // Envía el mensaje de correo electrónico
	        Transport.send(message);

	        System.out.println("Mensaje enviado correctamente a " + destinatario);
	    } catch (MessagingException e) {
	        e.printStackTrace();
	    }
	}

}
