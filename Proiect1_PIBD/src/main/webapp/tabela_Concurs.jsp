<%-- 
    Document   : tabela_Consultatie
    Created on : Nov 14, 2016, 1:03:20 PM
    Author     : vali
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Tabela Concurs</title>
<style>
table {
	font-family: 'Varela Round', sans-serif;;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #D6EEEE;
}

tr:hover {
	background-color: #96D4D4;
}

.button {
	background-color: #D6EEEE;
	border-style: solid;
	border-color: #81caca;
	font-style: italic;
	font-family: 'Varela Round', sans-serif;
	color: black;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	cursor: pointer;
}

.button:hover {
	background-color: #96D4D4;
}

a.adauga:link, a.adauga:visited {
	background-color: #D6EEEE;
	color: black;
	padding: 15px 32px;
	border-style: solid;
	border-color: #81caca;
	font-family: 'Varela Round', sans-serif;
	text-align: center;
	text-decoration: none;
	font-size: 16px;
	display: inline-block;
}

a.adauga:hover, a.adauga:active {
	background-color: #81caca;
}
</style>
</head>
<jsp:useBean id="jb" scope="session" class="db.javabean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<ul class="nav navbar-nav">
			<li class="active"><a href="index.html"></i>Home</a></li>
			<li><a href="tabela_Profesori.jsp">Profesori </a></li>
			<li><a href="tabela_Catedre.jsp">Catedre </a></li>
			<li><a href="tabela_Concurs.jsp">Concurs </a></li>
		</ul>
	</div>
	</nav>
	<h1 align="center">
		<i>Tabela Participanti Concurs</i>
	</h1>
	<br />
	<form action="sterge_Concurs.jsp" method="post">
		<table border="1" align="center">
			<tr>
				<td><b>Mark:</b></td>
				<td><b>IdConcurs:</b></td>
				<td><b>NumeProfesor:</b></td>
				<td><b>PrenumeProfesor:</b></td>
				<td><b>Email:</b></td>
				<td><b>Unitate_Invatamant:</b></td>
				<td><b>AdresaScoala:</b></td>
				<td><b>Disciplina_Examen:</b></td>
				<td><b>Medie_Examen:</b></td>
				<td><b>Medie_Departajare:</b></td>
				<td><b>Medie_Bacalaureat:</b></td>
				<td><b>Grad:</b></td>
			</tr>
			<%
                    jb.connect();
                    ResultSet rs = jb.vedeConcurs();
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("idconcurs");
                %>
			<tr>
				<td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
				<td><%= x%></td>
				<td><%= rs.getString("NumeProfesor")%></td>
				<td><%= rs.getString("PrenumeProfesor")%></td>
				<td><%= rs.getString("Email")%></td>
				<td><%= rs.getString("Unitate_Invatamant")%></td>
				<td><%= rs.getString("AdresaScoala")%></td>
				<td><%= rs.getString("Disciplina_Examen")%></td>
				<td><%= rs.getFloat("Medie_Examen")%></td>
				<td><%= rs.getFloat("Medie_Departajare")%></td>
				<td><%= rs.getFloat("Medie_Bacalaureat")%></td>
				<td><%= rs.getString("Grad")%></td>
				<%
                        }
                    %>
			</tr>
		</table>
		<br />
		<p align="center">
			<a href="nou_Concurs.jsp" class="adauga"><i>Adauga un nou
					participant</i></a> <input class="button" type="submit"
				value="Sterge liniile marcate">
		</p>
	</form>
	<%
            rs.close();
            jb.disconnect();
        %>
	<br />
</body>
</html>