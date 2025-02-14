<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Product Page</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>

<h2>Product Checkout</h2>

<form:form action="${pageContext.request.contextPath}/product/checkout"
           method="POST"
           modelAttribute="productRequest">

    <div class="form-group">
        <label for="name">Product Name:</label>
        <form:input path="name" id="name" />
        <form:errors path="name" cssClass="error" />
    </div>

    <div class="form-group">
        <label for="quantity">Quantity:</label>
        <form:input path="quantity" id="quantity" type="number" min="1" />
        <form:errors path="quantity" cssClass="error" />
    </div>

    <div class="form-group">
        <label for="amount">Amount:</label>
        <form:input path="amount" id="amount" type="number" />
        <form:errors path="amount" cssClass="error" />
    </div>

    <form:hidden path="currency" value="USD" />

    <button type="submit" class="submit-button">Proceed to Checkout</button>
</form:form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>