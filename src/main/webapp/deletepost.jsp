<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dao.PersonDAO, com.example.bean.PersonVO"%>
<%@ page import="com.example.dao.PersonDAO" %>
<%@ page import="com.example.bean.PersonVO" %>
<%@ page import="com.example.common.FileUpload" %>
<%
	String sid = request.getParameter("id");
	String msg = "[에러] 데이터 삭제 ";
	if (sid != ""){  
		int id = Integer.parseInt(sid);
		PersonVO u = new PersonVO();
		u.setSeq(id);
		PersonDAO personDAO = new PersonDAO();
		String filename= personDAO.getPhotoFilename(id);
		if(filename != null)
			FileUpload.deleteFile(request,filename);
		int i=personDAO.deletePerson(u);
		if(i == 1) msg = "데이터 삭제 성공 !";
	}

%>

<script>
	alert('<%=msg%>');
	location.href='posts.jsp';
</script>