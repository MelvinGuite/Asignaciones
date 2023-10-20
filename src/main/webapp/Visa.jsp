<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/visa.css">
    <title>Página de Pago</title>
    
    <style type="text/css">

    </style>
    
</head>
<%String usuario = request.getParameter("usuario"); 
String monto = request.getParameter("monto");
String tipo = request.getParameter("tipo");
if(usuario == null ) {
	response.sendRedirect("index.jsp");
}
%>

<body>
    <div class="container">
        <div class="credit-card">
            <div class="card-number" id="cardNumber">#### #### #### ####</div>
            <div class="card-holder" id="cardHolder">Nombre del Titular</div>
            <div class="card-expiry" id="cardExpiry">MM/AA</div>
        </div>
        <form action="ProcesarPago" method="get">
            <label for="cardNumberInput">Número de Tarjeta:</label>
            <input type="text" id="cardNumberInput" placeholder="**** **** **** ****" maxlength="19" required="required">
            <label for="cardHolderInput">Nombre del Titular:</label>
            <input type="text" id="cardHolderInput" placeholder="Nombre del Titular" required="required">
            <label for="cardExpiryInput">Fecha de Vencimiento:</label>
            <input type="text" id="cardExpiryInput" placeholder="MM/AA" maxlength="5" required="required">
            <label for="amountInput">Monto a Pagar:</label>
            <input type="text" id="monto" name="monto" value="<%=monto%>" required="required" readonly="readonly">
            <input type="text" id="carnet" name="carnet" value="<%=usuario%>" required="required" readonly="readonly">
            <input type="text" id="tipo" name="tipo" value="<%=tipo%>" required="required" readonly="readonly">
            <div class="buttons">
                <button id="payButton">Pagar</button>
                  <button id="cerrarButton">Regresar</button>
            </div>
        </form>
    </div>
        <script>
        // Esta función se ejecutará cuando se haga clic en el botón
        function cerrarPagina() {
            window.close();
        }

        // Asociar la función al evento 'click' del botón
        document.getElementById('cerrarButton').addEventListener('click', cerrarPagina);
    </script>
      
    
    <script src="script.js"></script>
    
      <script type="text/javascript">
      const cardNumberInput = document.getElementById('cardNumberInput');
      const cardHolderInput = document.getElementById('cardHolderInput');
      const cardExpiryInput = document.getElementById('cardExpiryInput');
      const cardNumber = document.getElementById('cardNumber');
      const cardHolder = document.getElementById('cardHolder');
      const cardExpiry = document.getElementById('cardExpiry');

      cardNumberInput.addEventListener('input', () => {
          cardNumberInput.value = cardNumberInput.value.replace(/\D/g, '');
          const value = cardNumberInput.value.replace(/\D/g, '');
          cardNumberInput.value = value.replace(/(\d{4})/g, '$1 ').trim();
          cardNumber.textContent = cardNumberInput.value;
      });

      cardHolderInput.addEventListener('input', () => {
          // Transforma el texto ingresado a mayúsculas
          cardHolderInput.value = cardHolderInput.value.toUpperCase();
          
          // Evita que se ingresen números en el campo "Nombre del Titular"
          cardHolderInput.value = cardHolderInput.value.replace(/\d/g, '');

          cardHolder.textContent = cardHolderInput.value;
      });

      cardExpiryInput.addEventListener('input', () => {
          let value = cardExpiryInput.value;

          if (value.length === 2) {
              cardExpiryInput.value = value + '/';
          }
      });

    </script>
</body>
</html>
