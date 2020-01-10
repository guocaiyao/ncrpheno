<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--<title>ncRPheDB_evidence</title>--%>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <meta name="keywords" content="ncRPheno, database, noncoding RNA, ncRNA, lncRNA, miRNA, circRNA, piRNA, snoRNA, lincRNA disease, phenotype"/>

    <link rel="icon" type="image/x-icon" href="static/images/ncrphenoTitle_logo.png">
    <title>ncRPheno ncRNA search</title>


    <script src="lib/jquery.min.js"></script>
    <script src="lib/fuzzySearch/prettify.js" type="text/javascript"></script>
    <script src="lib/fuzzySearch/bootstrap-typeahead.js" type="text/javascript"></script>

    <link rel="stylesheet" href="lib/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="lib/bootstrap/bootstrap-theme.min.css"/>
    <script src="lib/bootstrap/js/bootstrap.min.js"></script>


    <script src="lib/fuzzySearch/mockjax.js" type="text/javascript"></script>

    <script src="lib/fuzzySearch/fuzzySearch_ncRNA.js" type="text/javascript"></script>

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
                <h2><span class="main">Please input a ncRNA symbol:</span></h2>
                <%--<p>Please input a ncRNA symbol:</p><br>--%>
                <input type="text" id="input_ncRNA" class="form-control" placeholder="Input a ncRNA symbol" style="width: 200px; display: inline">

                <select id="SelectSpecies" class="form-control" style="width: 200px; display: inline;">
                    <option selected = "selected">Homo sapiens</option>
                    <option>Mus musculus</option>
                    <option>Rattus norvegicus</option>
                    <option>Macaca mulatta</option>
                    <option>Marmoset</option>
                    <option>Pan troglodytes</option>
                    <option>zebrafish</option>
                    <option>Canis familiaris</option>
                    <option>Sus scrofa</option>
                    <option>Cow</option>
                    <option>Rabbit</option>
                </select>
                <button id="Search" type="button" class="btn btn-warning" style="margin-left: 20px">Search</button><br>
                <%--<p>eg. HOTAIR, NONHSAT003779.2, hsa-mir-103b-1, mmu-mir-697, rno-mir-141, circHIPK3, SNORD64 </p>--%>
                <p>eg. HSA-MIR-1225, SOX21-AS1, HSA_CIRCRNA_104194, mmu-mir-697 </p>

                <p style="font-size:20px;color:blue" id="patient"></p>

                <%--<p id="title_information"></p>--%>
                <%--<table border="1" style="width: 1150px" class="table table-striped table-bordered table-hover table-condensed">--%>
                <%--<tbody id = "table_information"></tbody>--%>
                <%--</table><br><br>--%>

                <p id="title_association"></p><br>
                <a style="display: none;" id="downloadtable">DownLoadTable</a>
                <button style="visibility: hidden; margin-bottom: 10px; width: 200px;" id="dtBtn" class="btn btn-warning" onclick="downloadTable()">Download Table</button>
                <button style="visibility: hidden; margin-bottom: 10px; width: 200px; margin-left: 20px;display: inline" id="toTreeview" class="btn btn-warning">Tree Visualization</button>
                <button style="visibility: hidden; margin-bottom: 10px; width: 200px; margin-left: 20px" id="toNetwork" class="btn btn-warning">Network Visualization</button>


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
<%--<script src="Jquery.min.js" type="text/javascript"></script>--%>
<script src="lib/d3.v3.min.js"></script>

<script src="lib/saveSvgAsPng/saveSvgAsPng.js" type="text/javascript"></script>

<script src="static/js/ncRNA_Search.js" type="text/javascript"></script>
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
    $('#toTreeview').click(function () {
        window.open('Treeview.jsp?'+$('#input_ncRNA').val()+'&'+$('#SelectSpecies').val(),'_blank');
    })
</script>

<script type="text/javascript">
    $('#toNetwork').click(function () {
        window.open('Disease_network.jsp?'+$('#input_ncRNA').val()+'&'+$('#SelectSpecies').val(),'_blank');
    })
</script>

</body>
</html>

