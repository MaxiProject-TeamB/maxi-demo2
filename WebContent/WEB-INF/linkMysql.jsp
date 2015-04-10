<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<body>
<%
Connection con;
Statement sql;
ResultSet rs;
try{Class.forName("com.mysql.jdbc.Driver").newInstance();}
catch(Exception e){out.print(e);}
try{
    String uri="jdbc:mysql://localhost:3306/test";
    con=DriverManager.getConnection(uri,"root","");
    sql=con.createStatement();
    rs=sql.executeQuery("SELECT * FROM auction_user");
    out.print("<table border=2>");
    out.print("<tr>");
    out.print("<th width=100>"+"user_id");
    out.print("<th width=100>"+"username");
    out.print("<th width=100>"+"userpass");
    out.print("<th width=100>"+"email");
    out.print("</tr>");
    while(rs.next()){
        out.print("<tr>");
        out.print("<td>"+rs.getString(1)+"</td>");
        out.print("<td>"+rs.getString(2)+"</td>");
        out.print("<td>"+rs.getString(3)+"</td>");
        out.print("<td>"+rs.getString(4)+"</td>");
        out.print("</tr>");
    }
    out.print("</table>");
    con.close();
}
catch(SQLException e1){out.print(e1);}
%>
</body>
</html>