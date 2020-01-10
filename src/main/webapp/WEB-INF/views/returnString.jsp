<%--
  Created by IntelliJ IDEA.
  User: gyao
  Date: 1/8/20
  Time: 9:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <script src="/js/jquery-3.3.1.js"></script>
</head>
<body>
    <button id="ajaxRequest">submit</button>
</body>
<script>
    $(function () {
        $("#ajaxRequest").click(function () {
            $.ajax({
                methods:"post",
                url:"/ncrphedb/returnString.do",
                success:function (result) {
                    alert(result)
                }
            });
        });
    });
</script>
</html>
