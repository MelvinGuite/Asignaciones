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

public class ServicioCorreo {

	public void EnviaCorreo( String destinatario, String nombre, String apellido, String carnet) throws UnsupportedEncodingException {

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
	        // Crea un mensaje de correo electrónico
	        Message message = new MimeMessage(session);
	        //configuracion del remitente
	        message.setFrom(new InternetAddress("mguitec@miumg.edu.gt", "Universidad Mariano Gálvez de Guatemala"));

	        // Agrega el destinatario al mensaje
	        message.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));

	        // Configura el asunto 
	        message.setSubject("¡Bienvenido a la Universidad Mariano Gálvez de Guatemala!");
	        
	        //Cuerpo del mensaje
	        String mensaje = "Querido (a) " + nombre + " " + apellido + ",\n\n"
	                + "¡Es con gran emoción y alegría que te damos la más cordial bienvenida a la Universidad Mariano Gálvez de Guatemala!\n\n"
	                + "Estamos encantados de informarte que tu proceso de registro se ha completado exitosamente, y ahora formas parte de nuestra comunidad universitaria. Este es el comienzo de un emocionante viaje académico y personal que estamos seguros será lleno de aprendizaje, crecimiento y oportunidades.\n\n"
	                + "A continuación, te proporcionamos tus credenciales de acceso que te permitirán explorar y aprovechar todos los recursos y servicios que nuestra universidad tiene para ofrecer:\n\n"
	                + "- **Nombre de Usuario**: " + carnet + "\n"
	                + "- **Contraseña**: " + carnet + "\n\n"
	                + "Por razones de seguridad, te recomendamos encarecidamente cambiar tu contraseña temporal tan pronto como inicies sesión por primera vez en nuestro portal en línea. Esto garantizará la seguridad de tu cuenta y te permitirá acceder a tus cursos, información académica y demás servicios de manera segura.\n\n"
	           
	                + "Nuestro campus está lleno de oportunidades para que explores tus pasiones, desarrolles nuevas habilidades y forjes amistades duraderas. Estamos comprometidos a brindarte una educación de calidad y a apoyarte en cada paso de tu camino.\n\n"
	                + "Si tienes alguna pregunta, necesitas orientación o asistencia, no dudes en ponerte en contacto con nuestro equipo de soporte \n\n"
	                + "Te deseamos todo el éxito en tu viaje universitario y estamos emocionados por lo que el futuro tiene reservado para ti en la Universidad Mariano Gálvez de Guatemala. ¡Bienvenido a nuestra comunidad académica!\n\n"
	                + "Atentamente,\n"
	                + "Melvin Güité\n"
	                + "Desarrollo de Software\n"
	                + "Universidad Mariano Gálvez de Guatemala\n";

	        message.setText(mensaje);

	        // Envía el mensaje de correo electrónico
	        Transport.send(message);

	        System.out.println("Mensaje enviado correctamente a " + destinatario);
	    } catch (MessagingException e) {
	        e.printStackTrace();
	    }
	}

}