<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022/8/16
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>--%>
<%--<html>--%>
<%--<meta http-equiv=”Content-Type” content=”text/html; charset=utf-8″>--%>
<%--<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<head>--%>
<%--    <title>Upload</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<form method="post" action="${pageContext.request.contextPath}/fileUpload.do" name="fileupload" enctype="multipart/form-data">--%>
<%--    姓名： <input type="file" name="fileupload"></br>--%>
<%--    姓名： <input type="file" name="fileupload"></br>--%>
<%--    <button type="submit">提交</button>--%>
<%--</form>--%>

<%--</body>--%>
<%--</html>--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
    <title>Upload File Request Page</title>
</head>
<body>
<form method="POST" action="uploadFile" enctype="multipart/form-data">
    File to upload: <input type="file" name="file">
    <input type="submit" value="Upload"> Press here to upload the file!
</form>
</body>
</html>

