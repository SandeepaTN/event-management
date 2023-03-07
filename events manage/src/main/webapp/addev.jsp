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
<title>Insert title here</title>
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
<a href="add.jsp" class="btn">Add</a>
 <a href="update.jsp" class="btn">Update</a>
  <a href="delet.jsp" class="btn">Delete Event</a>
<a href="attendence.jsp" class="btn">Attendance</a>
<br>
 <h2>${username}</h3> <br>
<h3>Organization ID:${org_id1 }<h3></h3><br>
<form action="insertEvent" method="post">
  
 
  <label for="ev_name1">Event Name:</label>
  <input type="text" id="ev_name1" name="ev_name1" required>
  <br>
  <label for="ev_date1">Event Date:</label>
  <input type="text" id="ev_date1" name="ev_date1" pattern="^\d{4}\-((0[1-9])|(1[012]))\-((0[1-9])|([12][0-9])|(3[01])" placeholder="yyyy-mm-dd" required>
  <br>
  <label for="ev_time1">Event Time:</label>
  <input type="text" id="ev_time1" name="ev_time1" pattern="(2[0-3]|[01][0-9]):[0-5][0-9]" placeholder="hh:mm" required>
  <br>
  <label for="venue"1>Event Venue:</label>
  <input type="text" id="venue1" name="venue1" required>
  <br>
  <label for="description1">Event Description:</label>
  <input type="text" id="description1" name="description1">
  <br>
  <label for="contact1">Contact Number:</label>
  <input type="tel" id="contact1" name="contact1" pattern="[0-9]{10}" required>
  <br>
  <label for="ev_link1">Event Link:</label>
  <input type="text" id="ev_link1" name="ev_link1">
  <br>
  <input type="submit" value="Submit">
</form>
<%

/*ev_id	int	NO	PRI		auto_increment
org_id	int	NO	MUL		
ev_name	varchar(45)	NO			
ev_date	date	NO			
ev_time	time	YES			
venue	varchar(100)	NO			
desciption	varchar(255)	YES			
ev_link	varchar(255)	YES			
contact	varchar(15)	NO	*/		

session.setAttribute("ev_name1", request.getParameter("ev_name1"));
session.setAttribute("ev_date1", request.getParameter("ev_date1"));
session.setAttribute("ev_time1", request.getParameter("ev_time1"));
session.setAttribute("venue1", request.getParameter("venue1"));
session.setAttribute("ev_link1", request.getParameter("ev_link1"));
session.setAttribute("contact1", request.getParameter("contact1"));
int org_id2 = org_id1;
if(session.getAttribute("org_id1")!=null)
org_id2=(int)session.getAttribute("org_id1");
request.setAttribute("org_id2", org_id2);

%>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost:3306/event_management"
user="root"  password="123456"/>

<sql:update dataSource="${snapshot}" var="result">
INSERT INTO event (org_id, ev_name, ev_date, ev_time, venue, desciption, ev_link, contact)
VALUES (${org_id2}, '${ev_name1}', ${ev_date1},'${ev_time1}','${venue1}', '${description1}', '${ev_link1}', '${contact1}')
<!--<sql:param value="${org_id1}"/>
<sql:param value="${param.ev_name1}"/>
<sql:param value="${param.ev_date1}"/>
<sql:param value="${param.ev_time1}"/>
<sql:param value="${param.venue1}"/>
<sql:param value="${param.description1}"/>
<sql:param value="${param.ev_link1}"/>
<sql:param value="${param.contact1}"/>-->
</sql:update>

<c:if test="${result > 0}">
<p>Event inserted successfully!</p>
</c:if>
<c:if test="${result <= 0}">
<p>Error inserting event!</p>
</c:if>


<form action="logout">
<input type="submit" value="logout">
</body>
</html>



