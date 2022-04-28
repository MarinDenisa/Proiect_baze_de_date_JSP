<%-- 
    Document   : m2_Catedra
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
        <title>Tabela Profesori</title>
<title>Tabela Catedra</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
<style>
a.adauga:link, a.adauga:visited {
	background-color: #D6EEEE;
	color: black;
	padding: 15px 32px;
	border-style: solid;
	border-color: #81caca;
	font-family: 'Varela Round', sans-serif;;
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
	<h1 align="center">Modificarile au fost efectuate !</h1>
	<br />
	<p align="center">
		 <a href="nou_Catedra.jsp" class="adauga"><i>Adauga
				o noua catedra</i></a>
	</p>
	<%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("idcatedra"));
            String Disciplina = request.getParameter("Disciplina");
            String Unitate_Invatamant = request.getParameter("Unitate_Invatamant");
            String Nivel_Invatamant = request.getParameter("Nivel_Invatamant");
            String Adresa = request.getParameter("Adresa");
            String Mediu_Invatamant =request.getParameter("Mediu_Invatamant");
            String Numar_ore =request.getParameter("Numar_ore");

            String[] valori = {Disciplina, Unitate_Invatamant, Nivel_Invatamant, Adresa, Mediu_Invatamant, Numar_ore};
            String[] campuri = {"Disciplina", "Unitate_Invatamant","Nivel_Invatamant", "Adresa", "Mediu_Invatamant", "Numar_ore"};
            jb.modificaTabela("catedre", "idcatedra", aux, campuri, valori);
            jb.disconnect();
        %>


</body>
</html>