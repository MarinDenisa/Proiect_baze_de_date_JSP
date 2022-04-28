<%-- 
    Document   : nou_Pacient
    Created on : Nov 14, 2016, 1:08:21 PM
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
<title>Adauga catedra</title>
<style>
table {
	font-family: 'Varela Round', sans-serif;
	border-collapse: collapse;
	width: 50%;
}

table.center {
	margin-left: auto;
	margin-right: auto;
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
margin: 50px;
	background-color: #D6EEEE;
	border-style: solid;
	border-color: #81caca;
	font-style: italic;
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



p.b {
	font-family: 'Varela Round', sans-serif;;
	text-align: center;
	font-size: 200%;
	background-color: #D6EEEE;
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
				<li><a href="#">Profesori </a></li>
				<li><a href="tabela_Catedre.jsp">Catedre </a></li>
				<li><a href="tabela_Concurs.jsp">Concurs </a></li>
			</ul>
		</div>
	</nav>
	<%
            int Numar_ore;
            String NumarOre;
            String Disciplina = request.getParameter("Disciplina");
            String Unitate_Invatamant = request.getParameter("Unitate_Invatamant");
            String Nivel_Invatamant = request.getParameter("Nivel_Invatamant");
            String Adresa = request.getParameter("Adresa");
            String Mediu_Invatamant = request.getParameter("Mediu_Invatamant");
            NumarOre = request.getParameter("Numar_ore");
            //Integer.parseInt(request.getParameter("Numar_ore"));
           
           
            if (Disciplina != null) {
                jb.connect();
                jb.adaugaCatedra(Disciplina, Unitate_Invatamant, Nivel_Invatamant, Adresa, Mediu_Invatamant, java.lang.Integer.parseInt(NumarOre));
                jb.disconnect();
        %>
	<p class="b">
		<i> Datele au fost adaugate</i>
		
	</p>
	
	<%
        } else {
        %>
	<h1 align="center">Suntem in tabela catedre</h1>
	<form action="nou_Catedra.jsp" method="post">
		<table class="center">
			<tr>
				<td align="right">Disciplina:</td>
				<td><input type="text" name="Disciplina" size="45" /></td>
			</tr>
			<tr>
				<td align="right">Unitate_Invatamant :</td>
				<td><input type="text" name="Unitate_Invatamant" size="45" /></td>
			</tr>
			<tr>
				<td align="right">Nivel_Invatamant :</td>
				<td><input type="text" name="Nivel_Invatamant" size="20" /></td>
			</tr>
			<tr>
				<td align="right">Adresa:</td>
				<td><input type="text" name="Adresa" size="30" /></td>
			</tr>
			<tr>
				<td align="right">Mediu_Invatamant:</td>
				<td><input type="text" name="Mediu_Invatamant" size="10" /></td>
			</tr>
			<tr>
				<td align="right">Numar_ore :</td>
				<td><input type="text" name="Numar_ore" size="5" /></td>
			</tr>
		</table>
		<p align="center">
			<input class="button"
				type="submit" value="Adauga catedra">
		</p>

	</form>
	<%
            }
        %>

</body>
</html>