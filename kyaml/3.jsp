<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
        <h1>k1mysql-test</h1>
        <%
        Class.forName("com.mysql.jdbc.Driver");
        String dbUrl = "jdbc:mysql://10.96.208.121/kay_db";
        String dbUser = "kay";
        String dbPass = "Ekfrldndb#3";
        Connection con = DriverManager.getConnection
                        (dbUrl, dbUser, dbPass);
        String sql = "select * from member;";
        PreparedStatement pstmt = con.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery(sql);
        %>
        <table border="1">
                <tr>
                        <th>ip</th>
                        <th>pass</th>
                        <th>name</th>
                </tr>
                <%
                while (rs.next()) {
                %>
                <tr>
                        <td><%=rs.getString("id")%></td>
                        <td><%=rs.getString("pass")%></td>
                        <td><%=rs.getString("name")%></td>
                </tr>
                <%
                }
                %>
        </table>
</body>
</html>
