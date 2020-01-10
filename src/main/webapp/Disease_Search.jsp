<%--
  Created by IntelliJ IDEA.
  User: wzhang
  Date: 6/20/18
  Time: 11:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--<title>ncRPheDB_evidence</title>--%>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>ncRPheno Disease Search</title>

        <script src="lib/jquery.min.js"></script>
        <script src="lib/fuzzySearch/prettify.js" type="text/javascript"></script>
        <script src="lib/fuzzySearch/bootstrap-typeahead.js" type="text/javascript"></script>

        <link rel="stylesheet" href="lib/bootstrap/css/bootstrap.css"/>
        <link rel="stylesheet" href="lib/bootstrap/bootstrap-theme.min.css"/>
        <script src="lib/bootstrap/js/bootstrap.min.js"></script>


        <script src="lib/fuzzySearch/mockjax.js" type="text/javascript"></script>

        <script src="lib/fuzzySearch/fuzzySearch_Disease.js" type="text/javascript"></script>


        <link href="static/css/innerstyle.css" rel="stylesheet" type="text/css" />

        <meta charset="utf-8">

        <link rel="stylesheet" type="text/css" href="lib/Table_fileter3/bootstrap-3.3.4.css">
        <link rel="stylesheet" type="text/css" href="lib/Table_fileter3/dataTables.bootstrap.css">

        <script type="text/javascript" language="javascript" src="lib/Table_fileter3/jquery.dataTables.min.js"></script>
        <script type="text/javascript" language="javascript" src="lib/Table_fileter3/dataTables.bootstrap.js"></script>

</head>
<body>
<!--topMain start -->
<div id="topMain">

    <!--top start -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div id="top">

            <a href="ncrpheno.html"><img src="lib/images/ncrpheno_logo.png" alt="charged" width="1200" height="85" border="0" class="logo" /></a>

            <!--top end -->
        </div>

        <div class="container-fluid">
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav nav-pills nav-justified">
                    <li><a href="ncrpheno.html">Home</a></li>
                    <li><a href="static/html/browse.html">Browse</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true">Search<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="ncRNA_Search.jsp">ncRNA Search</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="Disease_Search.jsp">Disease Search</a></li>
                            <li role="separator" class="divider"></li>

                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true">Utility<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="ncRNAlyzer.jsp">ncRNA prioritization</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="Networklyzer.jsp">Network visualization</a></li>
                            <li role="separator" class="divider"></li>
                        </ul>
                    </li>
                    <li><a href="WebService.jsp">Web Service</a></li>
                    <li><a href="Download.jsp">Download</a></li>
                    <li><a href="Submit.jsp">Submit</a></li>
                    <li><a href="help.jsp">Help</a></li>


                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->

    </nav>
    <!--botMain start -->
    <div id="botMain">
        <!--bot start -->
        <div id="bot">
            <!--right panel start -->
            <div id="right">
                <h2><span class="main">Please input a disease:</span></h2>
                <%--<p>Please input a disease:</p><br>--%>
                <input type="text" id="input_disease" placeholder="Input a disease" class="form-control" style="width: 200px; display: inline">
                <select id="SelectType" class="form-control" style="width: 200px; display: inline;">
                    <option  selected = "selected" >All ncRNA types</option>
                    <option>lncRNA</option>
                    <option>microRNA</option>
                    <option>circRNA</option>
                    <option>piRNA</option>
                    <option>snoRNA</option>
                </select>
                <button id="Search" type="button" class="btn btn-warning" style="margin-left: 20px">Search</button><br>
                <p>eg. Rheumatic disease, Chronic lymphocytic leukemia,  Papillary thyroid carcinoma</p><br>

                <p style="font-size:20px;color:blue" id="patient"></p>
                <p id="title_association"></p><br>
                <a style="display: none;" id="downloadtable">DownLoadTable</a>
                <button style="visibility: hidden; margin-bottom: 10px; width: 200px;" id="dtBtn" class="btn btn-warning" onclick="downloadTable()">Download Table</button>
                <button style="visibility: hidden; margin-bottom: 10px; width: 200px; margin-left: 20px" id="toWordle" class="btn btn-warning">Word-Cloud Visualization</button>


                <table id="tabletoDL" border="1" style="width: 1150px;font-size:14px" class="table table-striped table-bordered table-hover table-condensed">
                    <thead id="table_head"></thead>
                    <tbody id = "table_association"></tbody>
                </table>
            </div>
            <!--right panel end -->
        </div>
        <!--bot end -->
        <br class="spacer" />
    </div>
    <!--botMain end -->
    <!--footer start -->
    <div id="footerMain">
        <!--footer start -->
        <div id="footer">
            <p class="department">Bioinformatics Laboratory for Precision Medicine</p>
            <p class="copyright">Copyright @ SUN YAT-SEN UNIVERSITY 2018</p>
        </div>
        <!--footer end -->
    </div>
    <!--footer end -->
</div>
<%--<script src="Jquery.min.js"></script>--%>
<script src="static/js/Disease_search.js" type="text/javascript"></script>
<script src="lib/d3.v3.min.js"></script>
<script src="lib/saveSvgAsPng/saveSvgAsPng.js" type="text/javascript"></script>
<script>
    function downloadTable(argument) {
        // 使用outerHTML属性获取整个table元素的HTML代码（包括<table>标签），然后包装成一个完整的HTML文档，设置charset为urf-8以防止中文乱码
        var html = "<html><head><meta charset='utf-8' /></head><body>" + document.getElementById("tabletoDL").outerHTML + "</body></html>";
        // 实例化一个Blob对象，其构造函数的第一个参数是包含文件内容的数组，第二个参数是包含文件类型属性的对象
        var blob = new Blob([html], { type: "application/vnd.ms-excel" });
        var a = document.getElementById("downloadtable");
        // 利用URL.createObjectURL()方法为a元素生成blob URL
        a.href = URL.createObjectURL(blob);
        // 设置文件名
        a.download = "DataTable.xls";
        var dow = document.getElementById('downloadtable');
        dow.click();
    }
</script>
<script type="text/javascript">
    $('#toWordle').click(function () {
        window.open('myWordCloud.html?'+$('#input_disease').val()+'&'+$('#SelectType').val(),'_blank');
    })
</script>
</body>
</html>
