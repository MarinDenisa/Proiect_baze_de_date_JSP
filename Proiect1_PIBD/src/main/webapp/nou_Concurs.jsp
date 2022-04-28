<%-- 
    Document   : nou_Concurs
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
<title>Adauga concurs</title>
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
	int idcatedra, idprofesor;
	String id1, id2, Disciplina, Unitate_Invatamant, AdresaScoala, NumeProfesor, PrenumeProfesor, Email, Disciplina_Examen,
			MedieExamen, MedieDepartajare, MedieBacalaureat, Grad;
	float Medie_Examen, Medie_Departajare, Medie_Bacalaureat;
	id1 = request.getParameter("idcatedra");
	id2 = request.getParameter("idprofesor");
	Disciplina_Examen = request.getParameter("Disciplina_Examen");
	MedieExamen = request.getParameter("Medie_Examen");
	MedieDepartajare = request.getParameter("Medie_Departajare");
	MedieBacalaureat = request.getParameter("Medie_Bacalaureat");
	Grad = request.getParameter("Grad");
	if (id1 != null) {
		jb.connect();
		jb.adaugaConcurs(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2), Disciplina_Examen,
		java.lang.Float.parseFloat(MedieExamen), java.lang.Float.parseFloat(MedieDepartajare),
		java.lang.Float.parseFloat(MedieBacalaureat), Grad);
		jb.disconnect();
	%>
	<p class="b">
		<i> Datele au fost adaugate</i>

	</p>
	<%
	} else {
	jb.connect();
	ResultSet rs1 = jb.vedeTabela("catedre");
	ResultSet rs2 = jb.vedeTabela("profesori");
	%>
	<h1 align="center">
		<i>Suntem in tabela concurs</i>
	</h1>
	<form action="nou_Concurs.jsp" method="post">
		<table class="center">
			<tr>
				<td align="right">IdCatedra:</td>
				<td>Selectati catedra: <SELECT NAME="idcatedra">
						<%
						while (rs1.next()) {
							idcatedra = rs1.getInt("idcatedra");
							Disciplina = rs1.getString("Disciplina");
							Unitate_Invatamant = rs1.getString("Unitate_Invatamant");
							AdresaScoala = rs1.getString("Adresa");
						%>
						<OPTION VALUE="<%=idcatedra%>"><%=idcatedra%>,<%=Disciplina%>,<%=Unitate_Invatamant%>,<%=AdresaScoala%></OPTION>
						<%
						}
						%>
				</SELECT>

				</td>
			</tr>
			<tr>
				<td align="right">IdProfesor:</td>
				<td>Selectati profesorul: <SELECT NAME="idprofesor">
						<!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
						<%
						while (rs2.next()) {
							idprofesor = rs2.getInt("idprofesor");
							NumeProfesor = rs2.getString("Nume");
							PrenumeProfesor = rs2.getString("Prenume");
							Email = rs2.getString("Email");
						%>
						<OPTION VALUE="<%=idprofesor%>"><%=idprofesor%>,<%=NumeProfesor%>,<%=PrenumeProfesor%>,<%=Email%></OPTION>
						<%
						}
						%>
				</SELECT>
				</td>
			</tr>
			<tr>
				<td align="right">Disciplina de examen:</td>
				<td><input type="text" name="Disciplina_Examen" size="30" /></td>
			</tr>
			<tr>
				<td align="right">Medie de examen:</td>
				<td><input type="text" name="Medie_Examen" size="10" /></td>
			</tr>
			<tr>
				<td align="right">Medie departajare:</td>
				<td><input type="text" name="Medie_Departajare" size="10" /></td>
			</tr>
			<tr>
				<td align="right">Medie bacalaureat:</td>
				<td><input type="text" name="Medie_Bacalaureat" size="10" /></td>
			</tr>
			<tr>
				<td align="right">Grad:</td>
				<td><input type="text" name="Grad" size="20" /></td>
			</tr>
		</table>
		<p align="center">
			 <input class="button"
				type="submit" value="Adauga participantul">
		</p>

	</form>
	<%
	}
	%>
</body>
</html>