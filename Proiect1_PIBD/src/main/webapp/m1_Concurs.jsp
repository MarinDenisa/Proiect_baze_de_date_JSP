<%-- 
    Document   : m1_Consultatie
    Created on : Nov 14, 2016, 1:39:35 PM
    Author     : vali
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
        <title>Tabela Concurs</title>
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
        <h1 align="center"><i> Tabela Concurs </i></h1>
        <br/>
        <%
            jb.connect();
            String Disciplina, Unitate_Invatamant, AdresaScoala, NumeProfesor, PrenumeProfesor, Email, Disciplina_Examen, Grad;

            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceConcursId(aux);
            rs.first();
            int id1 = rs.getInt("idcatedra");
            int id2 = rs.getInt("idprofesor");
            float Medie_Examen= rs.getFloat("Medie_Examen");
            float Medie_Departajare= rs.getFloat("Medie_Departajare");
            float Medie_Bacalaureat=rs.getFloat("Medie_Bacalaureat");

            NumeProfesor = rs.getString("NumeProfesor");
            PrenumeProfesor = rs.getString("PrenumeProfesor");
            Email = rs.getString("Email");
            Disciplina = rs.getString("Disciplina");
            Unitate_Invatamant = rs.getString("Unitate_Invatamant");
            AdresaScoala = rs.getString("AdresaScoala");
            Disciplina_Examen = rs.getString("Disciplina_Examen");
            Grad = rs.getString("Grad");

            ResultSet rs1 = jb.vedeTabela("catedre");
            ResultSet rs2 = jb.vedeTabela("profesori");
            int idcatedra, idprofesor;


        %>
        <form action="m2_Concurs.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdConsultatie:</td>
                    <td> <input type="text" name="idconcurs" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">idcatedra:</td>
                    <td> 
                        <SELECT NAME="idcatedra">
                            <%
                                while (rs1.next()) {
                                    idcatedra = rs1.getInt("idcatedra");
                                    Disciplina = rs1.getString("Disciplina");
                                    Unitate_Invatamant = rs1.getString("Unitate_Invatamant");
                                    AdresaScoala = rs1.getString("Adresa");
                                    if (idcatedra != id1) {
                            %>
                            <OPTION VALUE="<%= idcatedra%>"><%= idcatedra%>, <%= Disciplina%>, <%= Unitate_Invatamant%>, <%= AdresaScoala%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idcatedra%>"><%= idcatedra%>, <%= Disciplina%>, <%= Unitate_Invatamant%>, <%= AdresaScoala%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">idprofesor:</td>
                    <td> 
                        <SELECT NAME="idprofesor">
                            <%
                                while (rs2.next()) {
                                    idprofesor = rs2.getInt("idprofesor");
                                    NumeProfesor = rs2.getString("Nume");
                                    PrenumeProfesor = rs2.getString("Prenume");
                                    Email = rs2.getString("Email");
                            if (idprofesor != id2) {
                            %>
                            <OPTION VALUE="<%= idprofesor%>"><%= idprofesor%>, <%= NumeProfesor%>, <%= PrenumeProfesor%>, <%= Email%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idprofesor%>"><%= idprofesor%>, <%= NumeProfesor%>, <%= PrenumeProfesor%>, <%= Email%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">Disciplina_Examen:</td>
                    <td> <input type="text" name="Disciplina_Examen" size="30" value="<%= Disciplina_Examen%>"/></td>
                </tr>
                <tr>
                    <td align="right">Medie_Examen:</td>
                    <td> <input type="text" name="Medie_Examen" size="30" value="<%= Medie_Examen%>"/></td>
                </tr>
                <tr>
                    <td align="right">Medie_Departajare:</td>
                    <td> <input type="text" name="Medie_Departajare" size="30" value="<%= Medie_Departajare%>"/></td>
                </tr>
                <tr>
                    <td align="right">Medie_Bacalaureat:</td>
                    <td> <input type="text" name="Medie_Bacalaureat" size="30" value="<%= Medie_Bacalaureat%>"/></td>
                </tr>
                <tr>
                    <td align="right">Grad:</td>
                    <td> <input type="text" name="Grad" size="30" value="<%= Grad%>"/></td>
                </tr>
            </table><p align="center">
            
                <input class="button" type="submit" value="Modifica linia">
            </p>
        </form>
       
    </body>
    <%
        rs.close();
        rs1.close();
        rs2.close();
        jb.disconnect();
    %>
</html>