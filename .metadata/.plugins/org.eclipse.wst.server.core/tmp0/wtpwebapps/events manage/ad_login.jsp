<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


  <title>Event Manager - Admin Login</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      text-align: center;
      margin: 0;
      padding: 0;
    }
    .container {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    h1 {
      margin-bottom: 20px;
    }
    form {
      display: flex;
      flex-direction: column;
      align-items: center;
      width: 300px;
    }
    input[type="text"],
    input[type="password"] {
      width: 100%;
      height: 40px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 4px;
      padding: 0 10px;
      font-size: 16px;
    }
    input[type="submit"] {
      width: 100%;
      height: 40px;
      border: none;
      border-radius: 4px;
      background-color: #4caf50;
      color: white;
      font-size: 16px;
      cursor: pointer;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Malnad College of Engineering</h1>
    <h2>Event Manager</h2>
    <h3>Admin Login</h3>
 
     <form action="ad_login" method="post">
      <input type="text" name="uname" placeholder="Enter username">
      <input type="password" name="pass" placeholder="Enter password">
      <input type="submit" value="Login">
    </form>
  </div>



</body>
</html>