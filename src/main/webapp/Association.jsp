<%--
  Created by IntelliJ IDEA.
  User: wzhang
  Date: 6/25/18
  Time: 11:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--<title>ncRPheDB_evidence</title>--%>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>ncRPheno evidence</title>
        <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">
        </script>

        <link rel="stylesheet" href="lib/bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="lib/bootstrap/bootstrap-theme.min.css"/>
        <script src="lib/bootstrap/js/bootstrap.min.js"></script>

        <link href="static/css/innerstyle.css" rel="stylesheet" type="text/css" />
        <%--back to the top--%>
        <style type="text/css">

            .top_e{
                position:fixed;right:10px;bottom:40px;
                background:rgba(204,200,255,0.6);
                border-radius:15px;
                cursor:pointer;
                display:none;
                width:60px;
                height:60px;
            }
            .top_e:hover
            {
                color:white;
                background:#1296DB;
            }
        </style>
</head>
<body>
<!--topMain start -->
<div id="topMain">

    <!--top start -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div id="top">

            <a href="ncrpheno.html">
                <img src="static/images/ncrpheno_logo.png" alt="charged"
                     width="1200" height="85" border="0" class="logo" /></a>

            <!--top end -->
        </div>

        <div class="container-fluid">
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav nav-pills nav-justified">
                    <li><a href="ncrpheno.html">Home</a></li>
                    <li><a href="static/html/browse.html">Browse</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle"
                           data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="true">Search<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="ncRNA_Search.jsp">ncRNA Search</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="Disease_Search.jsp">Disease Search</a></li>
                            <li role="separator" class="divider"></li>

                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle"
                           data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="true">Utility<span class="caret"></span></a>
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

                <div id = 'detail information' style="width: 1100px;" class="panel panel-info">
                    <div class="panel-heading">
                        <h2 class="panel-title" style="color:#D27004">
                            Detail information for the association</h2>
                    </div>
                    <div class="panel-body">
                        <p  style="text-align:justify; text-justify:inter-ideograph;">
                            (1). <a id = "association" href = "#association"> Association information</a>
                        </p>

                        <p style="text-align:justify; text-justify:inter-ideograph;">
                            (2). <a   href="#title_association"> ncRNA information</a>
                        </p>

                        <p style="text-align:justify; text-justify:inter-ideograph;">
                            (3). <a  href="#disease_information">Disease phenotype information</a>
                        </p>

                        <p style="text-align:justify; text-justify:inter-ideograph;">
                            (4). <a  href="#Evidence_title_association">Evidence information for supporting the association</a>
                        </p>

                    </div>
                </div><br>
                <p style="font-size:20px;color:blue" id="patient"></p><br>
                
                
                <p id="title_association"></p><br>
                <table border="1" style="width: 1150px;" class="table table-striped table-bordered table-hover table-condensed">
                    <tbody id = "table_association"></tbody>
                </table><br><br>


                <p id="ncRNA_information"></p><br>
                <table border="1" style="width: 1100px;font-size:14px" class="table table-striped table-bordered table-hover table-condensed">
                    <tbody id = "ncRNA_table"></tbody>
                </table>

                <p id="disease_information"></p><br>
                <table border="1" style="width: 1100px;font-size:14px" class="table table-striped table-bordered table-hover table-condensed">
                    <tbody id = "disease_table"></tbody>
                </table><br>
                
                
                
                <p id="Evidence_title_association"></p><br>
                <table border="1" style="width: 1150px;" class="table table-striped table-bordered table-hover table-condensed">
                    <tbody id = "Evidence_table_association"></tbody>
                </table>

                <%--back to top--%>
                <div id="return-top" class="top_e">
                    <img src="static/images/backToTop.png" width="60" id="img" >
                    <div style="width:80px;margin:auto;">
                        <p id='font' style="font-size:15px;margin-left:2px;margin-top: 7.5px;display:none;">Back to<br>the top</p>
                    </div>
                </div>
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
<script src = "static/js/Association.js"></script>
<script type="text/javascript">
    $(window).scroll(function(){
        if($(window).scrollTop()>300){
            $('#return-top').fadeIn(300);
        }
        else{$('#return-top').fadeOut(200);}
    })


    // 点击按钮，使得页面返回顶部
    $("#return-top").click(function(){
        scrollTo(0,0);
    });
    // 鼠标悬浮按钮之上，图片消失，文字显示
    $(".top_e").mouseover(function(){
        $("#img").hide();
        $("#font").show();
    })
    //鼠标离开，文字消失，图片显示。
    $(".top_e").mouseout(function(){
        $("#font").hide();
        $("#img").show();
    })
</script>
</body>

</html>

