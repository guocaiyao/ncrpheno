<%--
  Created by IntelliJ IDEA.
  User: wzhang
  Date: 6/20/18
  Time: 11:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--<title>ncRPheDB_evidence</title>--%>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>ncRPheno ncRNA Search</title>



    <script src="lib/jquery.min.js" type="text/javascript"></script>
    <%--<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>--%>
    <%--<script src="fuzzySearch/bootstrap-typeahead.js" type="text/javascript"></script>--%>

    <link rel="stylesheet" href="lib/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="lib/bootstrap/bootstrap-theme.min.css"/>
    <script src="lib/bootstrap/js/bootstrap.min.js"></script>


    <%--<script src="fuzzySearch/mockjax.js" type="text/javascript"></script>--%>

    <%--<script src="fuzzySearch/fuzzySearch_ncRNA.js" type="text/javascript"></script>--%>

    <link href="static/css/innerstyle.css" rel="stylesheet" type="text/css" />

    <meta charset="utf-8">

    <style>

        .node circle {
            fill: #fff;
            stroke: steelblue;
            stroke-width: 2px;
        }

        .node {
            font: 7px sans-serif;
            font-weight:bold;
            fill: #0000FF;
        }

        .link {
            fill: none;
            stroke: #ccc;
            stroke-width: 2.5px;
        }

    </style>


</head>
<body>

<!--topMain start -->
<div id="topMain">

    <!--top start -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div id="top">

            <a href="ncrpheno.html"><img src="static/images/ncrpheno_logo.png" alt="charged" width="1200" height="85" border="0" class="logo" /></a>


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
    <!--navMain end -->
    <!--blackMain start -->

    <!--blackMain end -->
    <!--grey start -->
    <!--grey end -->
    <!--botMain start -->
    <div id="botMain">
        <!--bot start -->
        <div id="bot">
            <!--left panel start -->
            <!--left panel end -->
            <!--mid panel start -->
            <!--mid panel end -->
            <!--right panel start -->
            <div id="right">
                <p style="font-size:20px;color:blue" id="patient"></p><br>
                <p id="title_information" class="main"></p><br>
                <table class="table table-striped table-bordered table-hover table-condensed">
                    <tbody id="table_information"></tbody>
                </table><br><br>
                <p id="title_association" class="main"></p><br>
                <p id = "note"></p><br>
                <button id="imgSave" type="button" class="btn btn-warning" style="visibility: hidden; width: 200px; display: block; float: left;">Download</button>
                <TreeView id="TreeView"></TreeView>
                <script src="lib/d3.v3.min.js"></script>

                <%--<table border="1" id = "table_association" ></table>--%>

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
<%--<script src="Jquery.min.js" type="text/javascript"></script>--%>
<script src="lib/d3.v3.min.js"></script>
<script src="static/js/Treeview.js" type="text/javascript"></script>
<script src="lib/saveSvgAsPng/saveSvgAsPng.js" type="text/javascript"></script>
<script type="text/javascript">
    $("#imgSave").click(function () {
        saveSvgAsPng(document.getElementById("treeMap"), "treeMap.png", {backgroundColor: "white", encoderOptions: 1, scale: 2});//image quality setting
    });
</script>
</body>
</html>


