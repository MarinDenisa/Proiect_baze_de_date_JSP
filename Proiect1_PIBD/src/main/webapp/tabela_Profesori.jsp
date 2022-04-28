<%-- 
    Document   : tabela_Profesori
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
				<li><a href="#">Profesori </a></li>
				<li><a href="tabela_Catedre.jsp">Catedre </a></li>
				<li><a href="tabela_Concurs.jsp">Concurs </a></li>
			</ul>
		</div>
	</nav>
        <h1 align="center"> Tabela Profesori</h1>
        <br/>
        
        <form action="sterge_Profesor.jsp" method="post">
            <table border="1" align="center">
               <tr>
				<td><b>Mark:</b></td>
				<td><b>IdProfesor:</b></td>
				<td><b>Nume:</b></td>
				<td><b>Prenume:</b></td>
				<td><b>CNP:</b></td>
				<td><b>Adresa:</b></td>
				<td><b>Email:</b></td>
				<td><b>Numar_Telefon:</b></td>

			</tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("profesori");
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("idprofesor");
                %>
                <tr>
                    <th><input type="checkbox" name="primarykey" value="<%= x%>" /></th>
				<th><%= x%></th>
				<td><%= rs.getString("Nume")%></td>
				<td><%= rs.getString("Prenume")%></td>
				<td><%= rs.getString("CNP")%></td>
				<td><%= rs.getString("Adresa")%></td>
				<td><%= rs.getString("Email")%></td>
				<td><%= rs.getString("Numar_Telefon")%></td>
				<%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
              <a href="nou_Profesor.jsp" class="adauga"><i>Adauga
				un nou profesor</i></a> 
             <input class="button"   type="submit" value="Sterge liniile marcate">
             </p>
        </form>
        <%
            rs.close();
            jb.disconnect();
        %>
        <br/>
        
    </body>
</html>
