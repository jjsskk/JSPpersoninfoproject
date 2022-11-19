
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import ="com.example.*, java.io.File" %>
<%@ page import ="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<%
  String filename = "";
  int sizeLimit = 15*1024*1024;

  String realPath = request.getServletContext().getRealPath("upload");
  File dir= new File(realPath);
  if(!dir.exists())
      dir.mkdirs();
    MultipartRequest multipartRequest = null;
    multipartRequest = new MultipartRequest(request, realPath,sizeLimit,"utf-8",new DefaultFileRenamePolicy());
    System.out.println(realPath);
    filename= multipartRequest.getFilesystemName("photo");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
원래 파일 이름 =<%= multipartRequest.getOriginalFileName("photo")%><br/>
업로드한 파일경로=${pageContext.request.contextPath}/upload/<%=filename%><br/>
물리적인 파일경로=<%=realPath%><br/>
파일 이름 =<%=filename%><br/>
<img src="${pageContext.request.contextPath}/upload/<%=filename%>">
</body>
</html>
