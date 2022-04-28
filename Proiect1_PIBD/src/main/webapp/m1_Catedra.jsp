<%-- 
    Document   : m1_Catedra
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
        <title>Tabela Catedre</title>
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
        <h1 align="center"><i>Tabela catedre</i> </h1>
        <br/>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("catedre", "idcatedra", aux);
            rs.first();
            String Disciplina = rs.getString("Disciplina");
            String Unitate_Invatamant = rs.getString("Unitate_Invatamant");
            String Nivel_Invatamant = rs.getString("Nivel_Invatamant");
            String Adresa = rs.getString("Adresa");
            String Mediu_Invatamant = rs.getString("Mediu_Invatamant");
            int Numar_ore = rs.getInt("Numar_ore");
                        rs.close();
            jb.disconnect();
        %>
        <form action="m2_Catedra.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">Idcatedra:</td>
                    <td> <input type="text" name="idcatedra" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                 <tr>
                    <td align="right">Disciplina:</td>
                    <td> <input type="text" name="Disciplina" size="30" value="<%= Disciplina%>"/></td>
                </tr>
                <tr>
                    <td align="right">Unitate_Invatamant:</td>
                    <td> <input type="text" name="Unitate_Invatamant" size="30" value="<%= Unitate_Invatamant%>"/></td>
                </tr>
                <tr>
                    <td align="right">Nivel_Invatamant:</td>
                    <td> <input type="text" name="Nivel_Invatamant" size="30" value="<%= Nivel_Invatamant%>"/></td>
                </tr>
                 <tr>
                    <td align="right">Adresa:</td>
                    <td> <input type="text" name="Adresa" size="30" value="<%= Adresa%>"/></td>
                </tr>
                <tr>
                    <td align="right">Mediu_Invatamant:</td>
                    <td> <input type="text" name="Mediu_Invatamant" size="30" value="<%= Mediu_Invatamant%>"/></td>
                </tr>
                <tr>
                    <td align="right">Numar_ore:</td>
                    <td> <input type="text" name="Numar_ore" size="30" value="<%= Numar_ore%>"/></td>
                </tr>
                
            </table><p align="center">
            
            <a href="nou_catedra.jsp" class="adauga"><i>Adauga o noua catedra.</i></a> 
                <input class="button" type="submit" value="Modifica linia">
            </p>
        </form>
        
    </body>
</html>