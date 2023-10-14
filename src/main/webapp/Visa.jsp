<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Página de Pago</title>
    
    <style type="text/css">
    body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

.container {
    background-color: white;
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 20px;
    width: 300px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.credit-card {
    background-color: #007bff;
    color: white;
    padding: 15px;
    border-radius: 5px;
    text-align: right;
}

.card-number, .card-holder, .card-expiry {
    font-size: 18px;
    margin: 5px;
}

form label, form input {
    display: block;
    margin: 10px 0;
}

form input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

/* ... (código anterior) ... */

.credit-card {
    background: linear-gradient(135deg, #24b2d6 0%, #0c5a78 100%);
    color: white;
    padding: 15px;
    border-radius: 10px;
    text-align: right;
    position: relative;
}

.credit-card:before {
    content: "";
    background: url('chip.png') center no-repeat;
    background-size: 40px;
    width: 40px;
    height: 40px;
    display: block;
    position: absolute;
    top: 10px;
    left: 10px;
}

.credit-card:after {
    content: "";
    background: url('visa.jpg') center no-repeat;
    background-size: 50px;
    width: 50px;
    height: 50px;
    display: block;
    position: absolute;
    top: 10px;
    right: 10px;
}

/* ... (código anterior) ... */

form input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

input#cardExpiryInput {
    width: 45%;
    display: inline-block;
}





/* ... (código anterior) ... */

    
    </style>
    
</head>
<%String usuario = request.getParameter("usuario"); 
String monto = request.getParameter("monto");
String tipo = request.getParameter("tipo");
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
            <input type="text" id="cardNumberInput" placeholder="**** **** **** ****" maxlength="19">
            <label for="cardHolderInput">Nombre del Titular:</label>
            <input type="text" id="cardHolderInput" placeholder="Nombre del Titular">
            <label for="cardExpiryInput">Fecha de Vencimiento:</label>
            <input type="text" id="cardExpiryInput" placeholder="MM/AA" maxlength="5">
            <label for="amountInput">Monto a Pagar:</label>
            <input type="text" id="monto" name="monto" value="<%=monto%>">
            <input type="text" id="carnet" name="carnet" value="<%=usuario%>">
            <input type="text" id="tipo" name="tipo" value="<%=tipo%>">
            <div class="buttons">
                <button id="payButton">Pagar</button>
            </div>
        </form>
    </div>
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
