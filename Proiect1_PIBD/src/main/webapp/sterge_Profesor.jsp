<%-- 
    Document   : sterge_Profesor
  
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
<style>
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
			<li><a href="tabela_Profesori.jsp">Profesori </a></li>
			<li><a href="tabela_Catedre.jsp">Catedre </a></li>
			<li><a href="tabela_Concurs.jsp">Concurs </a></li>
		</ul>
	</div>
	</nav>
	<%
            String[] s = request.getParameterValues("primarykey");
         if(s!= null )
         {
            jb.connect();
            jb.stergeDateTabela(s, "profesori", "idprofesor");
            jb.disconnect();
         
            %>
	<p class="b">
		<i> Datele au fost sterse</i>

	</p>

	<%
                } else {
                %>
	<p class="b">
		<i> Nu s-a putut efectua stergerea!</i>

	</p>
	
	<%
            }
        %>
</body>
</html>