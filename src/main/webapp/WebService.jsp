<%--
  Created by IntelliJ IDEA.
  User: wzhang
  Date: 7/2/18
  Time: 4:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--<title>ncRPheno_evidence</title>--%>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>ncRPheno web service</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>

    <link rel="stylesheet" href="lib/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="lib/bootstrap/bootstrap-theme.min.css"/>
    <script src="lib/bootstrap/js/bootstrap.min.js"></script>

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
                <h2><span class="main">ncRPheno API</span></h2>
                <p align="justify" class="rightTxt">
                    The API interface can be invoked by users using a broad range of programming languages (python, Java, etc.), and all association data can be retrieved by providing the association identifier (ID) in ncRPheno, such as ncRP########.

                </p>
                <table id="tabletoDL" border="1" style="width: 1100px" class="table table-striped table-bordered table-hover table-condensed">
                    <tr><th>Example url:<br>http://lilab2.sysu.edu.cn/ncrpheno/Association_ID/ncRP00150000</th></tr>
                </table>
                <p align="justify" class="rightTxt"><b>Optional parameter: </b>Association identifier(ID) (12 characters)---This is the association identifier in ncRPheno, e.g. ncRP00150000.</p>
                <br>
                <h2><span class="main">The output data is available in the universal JSON format</span></h2>
                <%--<p id="show_p">{ "name": "Brett", "address":"北京路23号", "email": "123456@qq.com" }</p>--%>
                <pre id="out_pre" style="width: 1100px;color:Green">{"Results":[{"Node":"Neurodegenerative disease with chorea","ncRPheDB_ID":"ncRP00150000","Disease_Name":"Huntington disease","Ontology_ID":"Orphanet_399","ncRNA_Symbol":"TUNAR","Category":"lncRNA","Species":"Homo sapiens","Score":"0.181"}]}</pre>

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

<script src="lib/Jquery.min.js"></script>
<%--<script>arttemplate.js</script>--%>
<script type="text/javascript">
    var text = document.getElementById('out_pre').innerText; //获取json格式内容

    var result = JSON.stringify(JSON.parse(text), null, 2);//将字符串转换成json对象

    document.getElementById('out_pre').innerText= result ;


</script>

</body>



</html>
