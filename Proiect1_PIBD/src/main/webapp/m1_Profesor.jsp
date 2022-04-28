<%-- 
    Document   : m1_Profesor 
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
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
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
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
        <h1 align="center"><i>Tabela Profesori</i></h1>
        <br/>
       
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("Profesori", "idprofesor", aux);
            rs.first();
            String Nume = rs.getString("Nume");
            String Prenume = rs.getString("Prenume");
            String CNP = rs.getString("CNP");
            String Adresa = rs.getString("Adresa");
            String Email = rs.getString("Email");
            String Numar_Telefon = rs.getString("Numar_Telefon");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_Profesor.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdProfesor:</td>
                    <td> <input type="text" name="idprofesor" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Nume:</td>
                    <td> <input type="text" name="Nume" size="30" value="<%= Nume%>"/></td>
                </tr>
                <tr>
                    <td align="right">Prenume:</td>
                    <td> <input type="text" name="Prenume" size="30" value="<%= Prenume%>"/></td>
                </tr>
                <tr>
                    <td align="right">CNP:</td>
                    <td> <input type="text" name="CNP" size="30" value="<%= CNP%>"/></td>
                </tr>
                <tr>
                    <td align="right">Adresa:</td>
                    <td> <input type="text" name="Adresa" size="30" value="<%= Adresa%>"/></td>
                </tr>
                <tr>
                    <td align="right">Email:</td>
                    <td> <input type="text" name="Email" size="30" value="<%= Email%>"/></td>
                </tr>
                <tr>
                    <td align="right">Numar_Telefon:</td>
                    <td> <input type="text" name="Numar_Telefon" size="Numar_Telefon" value="<%= Numar_Telefon%>"/></td>
                </tr>
            </table><p align="center">
            
                <input class="button" type="submit" value="Modifica linia">
            </p>
    </body>
</html>