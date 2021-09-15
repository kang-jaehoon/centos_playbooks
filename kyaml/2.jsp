<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  <%@ page import ="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
  String pass = request.getParameter ("pass");
	String name = request.getParameter("name");

	String jdburl="jdbc:mysql://10.96.208.121/kay_db";
	String dbid = "kay";
	String dbpass ="Ekfrldndb#3";

	Connection conn = null;
	PreparedStatement pstmt = null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdburl , dbid, dbpass);
		String sql = "insert into member(id,pass,name) values(?,?,?)";
		pstmt = conn.prepareStatement(sql); //도로의 정보를 버스에게 준다고생각하자.
		pstmt.setString(1, id); //???? 의 값을 채워보자 자료형은 스트링(스트링인지 검사한다)이며 1 번째의 값은 id를 넣는다.
		pstmt.setString(2, pass);
		pstmt.setString(3, name);
		pstmt.executeUpdate();//버스출발! out.print("회원가입 성공");

	}catch(Exception e){
		out.println("Exception :" + e.getMessage());
	}
%>
