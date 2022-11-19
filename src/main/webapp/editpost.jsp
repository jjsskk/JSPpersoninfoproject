<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dao.PersonDAO"%>
<%@ page import="com.example.common.FileUpload" %>
<%@ page import="com.example.bean.PersonVO" %>

<% request.setCharacterEncoding("utf-8"); %>

<%--<jsp:useBean id="u" class="com.example.bean.PersonVO" />--%>
<%--<jsp:setProperty property="*" name="u"/>--%>

<%
	PersonDAO personDAO = new PersonDAO();
	FileUpload upload = new FileUpload();
	PersonVO u =upload.uploadPhoto(request);
	int i=personDAO.updatePerson(u);
	String msg = "데이터 수정 성공 !";
	if(i == 0) msg = "[에러] 데이터 수정 ";
%>
<script>
	alert('<%=msg%>');
	location.href='posts.jsp';
</script>