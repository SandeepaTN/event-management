<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

a.btn {
  display: inline-block;
  padding: 8px 15px;
  font-size: 18px;
  text-decoration: none;
  color: white;
  background-color: #4CAF50;
  margin: 5px;
}
form {
      display: flex;
      flex-direction: column;
      align-items: center;
      width: 300px;}
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
</style>
</head>
<body>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
response.setHeader("Expires", "0");
if(session.getAttribute("username")==null)
{
	response.sendRedirect("login.jsp");
}%>
<%
int org_id1 = 0;
if(session.getAttribute("org_id")!=null)
org_id1=(int)session.getAttribute("org_id");
request.setAttribute("org_id1", org_id1);
%>

<h1>Malnad College Of Engineering</h1><br>
<a href="addev.jsp" class="btn">Add</a>
 <a href="update.jsp" class="btn">Update</a>
  <a href="delet.jsp" class="btn">Delete Event</a>
<a href="attendence.jsp" class="btn">Attendance</a>
<br>
 <h2>${username}</h3> <br>
<h3>Organization ID:${org_id1 }<h3></h3><br>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/event_management" user="root" password="123456"/>
<sql:query var="result" dataSource="${db}">select *from event where event.org_id=?
<sql:param value= "${org_id1}"/></sql:query>

<table>
            <thead>
                <tr>
                    <th>Id</th>
                   <th>Event Name</th>
                   <th>Date</th>
                   <th>Time</th>
                   <th>Venue</th>
                  <th>Description</th>
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
               <td><a href="${row.ev_link}">Link</a></td>
                  
            </tr>
        </c:forEach>
    </tbody>
</table>
<br>
<br>
<form action="logout">
<input type="submit" value="logout">
</form>
</body>
</html>