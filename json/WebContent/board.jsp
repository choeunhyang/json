<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Connection con = DBCon.getCon();
String sql = "SELECT * from board_info";
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
List<Map<String,String>> list = new ArrayList<Map<String,String>>();
while(rs.next()){
	Map<String,String> bi = new HashMap<String,String>();
	bi.put("binum",rs.getString("binum"));
	bi.put("bititle",rs.getString("bititle"));
	bi.put("bitext",rs.getString("bitext"));
	bi.put("bicnt",rs.getString("bicnt"));
	list.add(bi);
	list.add(bi);
}
/* 
List<Map<String,String>> list = new ArrayList<Map<String,String>>();
for(int i=6;i<=10;i++){
	Map<String,String> user = new HashMap<String,String>();
	user.put("name","이름"+i);
	user.put("age",i+"");
	list.add(user);
} */
Gson gson = new Gson();
out.println(gson.toJson(list));
%>