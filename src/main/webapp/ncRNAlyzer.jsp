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
    <meta name="keywords" content="ncRPheno, database, noncoding RNA, ncRNA, lncRNA, miRNA, circRNA, piRNA, snoRNA, lincRNA disease, phenotype"/>

    <link rel="icon" type="image/x-icon" href="static/images/ncrphenoTitle_logo.png">
    <title>ncRNA prioritization</title>

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
<body >
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
            <div id="right" >
                <h2><span class="main">Please input a set of ncRNAs separated by newline character:</span></h2>
                <%--<p>Please input a disease:</p><br>--%>
                <textarea id="txtVal" style="width:1150px;height:100px;" class="form-control" placeholder="Please input a set of ncRNAs separated by newline character." ></textarea><br>

                <input type="text" id="input_disease" placeholder="Please enter a disease phenotype" class="form-control" style="width: 400px; display: inline">
                <%--<button  class="btn btn-warning" style="width: 200px;margin-left: 20px; " >Disease phenotype</button>--%>
                <button onclick="getexample()" type="button" class="btn btn-warning" style="margin-left: 30px; width:200px; display: inline" >Example</button>
                <div>
                    <button id="Search" type="button" class="btn btn-default btn-warning" style="margin-top: 30px;width: 300px;display: inline">Run</button>
                    <button  id="clear" type="button" class="btn btn-default btn-danger" style="margin-top: 30px;width: 300px;margin-left: 40px">Reset all</button>
                </div>

                <br>
                <h2 id = 'AnalysisResult'></h2>
                <p style="font-size:20px;color:blue" id="patient"></p>
                <a style="display: none;" id="downloadtable">DownLoadTable</a>


                <button style="visibility: hidden; margin-bottom: 10px; width: 200px;" id="dtBtn" class="btn btn-warning" onclick="downloadTable()">Download Table</button>

                <br>
                <table id="tabletoDL" border="1" style="width: 1150px;font-size:14px" class="table table-striped table-bordered table-hover table-condensed">
                    <thead id="table_head"></thead>
                    <tbody id = "table_association"></tbody>
                </table>
                <p id="sorry"></p><br>
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
<%--<script src="Jquery.min.js"></script>--%>
<script src="static/js/ncRNAlyzer.js" type="text/javascript"></script>

<script src="static/js/reset.js"></script>
<%--back to top--%>
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
    function getexample(){

        //
        var example1= "hsa-let-7b\n" +
            "hsa-let-7c\n" +
            "hsa-let-7e\n" +
            "hsa-let-7g\n" +
            "hsa-let-7i\n" +
            "hsa-mir-1-1\n" +
            "hsa-mir-1-2\n" +
            "hsa-mir-100\n" +
            "hsa-mir-103a-1\n" +
            "hsa-mir-103a-2\n" +
            "hsa-mir-105-1\n" +
            "hsa-mir-105-2\n" +
            "hsa-mir-106a\n" +
            "hsa-mir-106b\n" +
            "hsa-mir-107\n" +
            "hsa-mir-10b\n" +
            "hsa-mir-1179\n" +
            "hsa-mir-1180\n" +
            "hsa-mir-1181\n" +
            "hsa-mir-122\n" +
            "hsa-mir-1224\n" +
            "hsa-mir-1226\n" +
            "hsa-mir-1228\n" +
            "hsa-mir-1229\n" +
            "hsa-mir-1247\n" +
            "hsa-mir-1248\n" +
            "hsa-mir-1249\n" +
            "hsa-mir-1250\n" +
            "hsa-mir-1251\n" +
            "hsa-mir-1254-1\n" +
            "hsa-mir-1254-2\n" +
            "hsa-mir-1258\n" +
            "hsa-mir-125a\n" +
            "hsa-mir-125b-1\n" +
            "hsa-mir-125b-2\n" +
            "hsa-mir-126\n" +
            "hsa-mir-1262\n" +
            "hsa-mir-1266\n" +
            "hsa-mir-1269a\n" +
            "hsa-mir-1269b\n" +
            "hsa-mir-127\n" +
            "hsa-mir-1270\n" +
            "hsa-mir-1271\n" +
            "hsa-mir-1276\n" +
            "hsa-mir-1277\n" +
            "hsa-mir-196a-2\n" +
            "hsa-mir-196b\n" +
            "hsa-mir-197\n" +
            "hsa-mir-19a\n" +
            "hsa-mir-19b-1\n" +
            "hsa-mir-19b-2\n" +
            "hsa-mir-200a\n" +
            "hsa-mir-200b\n" +
            "hsa-mir-200c\n" ;
        var example2 = 'Breast cancer'
        document.getElementById('txtVal').value+=example1;
        document.getElementById('input_disease').value+=example2;
    }
</script>

</body>
</html>
