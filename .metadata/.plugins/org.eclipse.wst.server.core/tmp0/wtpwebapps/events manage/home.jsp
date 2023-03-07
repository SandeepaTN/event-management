<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Malnad College of Engineering - Event Manager</title>
<style>
    /* Add some CSS styles to improve the layout and design of the page */
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }
    h1 {
        text-align: center;
        padding: 20px;
        background-color: #006699;
        color: #fff;
        margin: 0;
    }
    .container {
        max-width: 1200px;
        margin: 0 auto;
    }
    .btn-container {
        text-align: center;
        margin: 20px 0;
    }
    .btn {
        padding: 10px 20px;
        background-color: #006699;
        color: #fff;
        text-decoration: none;
        margin: 0 10px;
    }
    .btn:hover {
        background-color: #004d66;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    th, td {
        padding: 10px;
        text-align: left;
        border-bottom: 1px solid #ccc;
    }
    th {
        background-color: #f2f2f2;
    }
    /* Add some media queries to make the page responsive */
    @media only screen and (max-width: 768px) {
        table {
            display: block;
            overflow-x: auto;
        }
    }
</style>
</head>
<body>
     <%
  Calendar calendar = Calendar.getInstance();
  java.util.Date currentDate = calendar.getTime();
  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
  String date = dateFormat.format(currentDate);
  out.println("Today's date is: " + date);
%>
     
    <h1>Malnad College of Engineering</h1>
    <div class="container">
        <div class="btn-container">
            <a href="login.jsp" class="btn">Organizer Login</a>
            <a href="ad_login.jsp" class="btn">Admin Login</a>
            <a href="search.jsp" class="btn">Search Student</a>
        </div>
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/event_management" user="root" password="123456"/>
        <sql:query dataSource="${db}" var="result">
            SELECT * FROM event where ev_date>='<%=date%>'
            order by ev_date ;
        </sql:query>

        <table>
            <thead>
                <tr>
                    <th>Id</th>
                   <th>Event Name</th>
                   <th>Date</th>
                   <th>Time</th>
                   <th>Venue</th>
                  <th>Description</th>
                  <th>Contact</th>
                  <th>Link</th>
           

      
        </tr>
    </thead>
    <tbody>
        <c:forEach var="row" items="${result.rows}">
            <tr>
                <td>${row.ev_id}</td>
                <td>${row.ev_name}</td>
                <td>${row.ev_date}</td>
                <td>${row.ev_time}</td>
                <td>${row.venue}</td>
                <td>${row.desciption}</td>
                <td>${row.contact}</td>
               <td><a href="${row.ev_link}">Link</a></td>
                  
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>