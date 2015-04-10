<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import ="java.sql.*" %>
<%
	try{Class.forName("com.mysql.jdbc.Driver").newInstance();}
	catch(Exception e){out.print(e);}
	try{
    String userid = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test",
            "root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from members where uname='" + userid 
    		+ "' and pass='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
	}catch(SQLException e){out.print(e);}
%>