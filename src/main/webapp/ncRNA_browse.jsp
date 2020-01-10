<%--
  Created by IntelliJ IDEA.
  User: wzhang
  Date: 7/20/18
  Time: 2:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>disease_browse</title>

    <script src="lib/jquery.min.js"></script>
    <script type="text/javascript" language="javascript" src="lib/Table_fileter3/jquery-1.10.2.js"></script>

    <script type="text/javascript" language="javascript" src="lib/Table_fileter3/jquery.dataTables.min.js"></script>
    <script type="text/javascript" language="javascript" src="lib/Table_fileter3/dataTables.bootstrap.js"></script>

    <link rel="stylesheet" type="text/css" href="lib/Table_fileter3/bootstrap-3.3.4.css">
    <link rel="stylesheet" type="text/css" href="lib/Table_fileter3/dataTables.bootstrap.css">



    <link rel="stylesheet" href="lib/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="lib/bootstrap/bootstrap-theme.min.css"/>
    <script src="lib/bootstrap/js/bootstrap.min.js"></script>




</head>
<body>
<!--topMain start -->
<div id="topMain">

    <!--top start -->

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

                <p style="font-size:20px;color:blue" id="patient"></p>
                <p id="title_association"></p><br>
                <a style="display: none;" id="downloadtable">DownLoadTable</a>
                <button style="visibility: hidden; margin-bottom: 10px; width: 200px;" id="dtBtn" class="btn btn-warning" onclick="downloadTable()">Download Table</button>
                <button style="visibility: hidden; margin-bottom: 10px; width: 200px; margin-left: 20px;display: inline" id="toTreeview" class="btn btn-warning">Tree Visualization</button>
                <button style="visibility: hidden; margin-bottom: 10px; width: 200px; margin-left: 20px" id="toNetwork" class="btn btn-warning">Network Visualization</button>




                <table id="tabletoDL" border="1" style="width: 920px;font-size:10px" class="table table-striped table-bordered table-hover table-condensed">
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
</div>
<script src="lib/d3.v3.min.js"></script>

<script src="lib/saveSvgAsPng/saveSvgAsPng.js" type="text/javascript"></script>

<script src="static/js/ncRNA_browse.js" type="text/javascript"></script>
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
        var tempt = document.getElementById("tabletoDL");
        var input_ncRNA = tempt.rows[1].cells[2].innerHTML;
        var SelectSpecies = tempt.rows[1].cells[5].innerHTML;
        window.open('Treeview.jsp?'+input_ncRNA+'&'+SelectSpecies,'_blank');
    })
</script>
<script type="text/javascript">
    $('#toNetwork').click(function () {
        var tempt = document.getElementById("tabletoDL");
        var input_ncRNA = tempt.rows[1].cells[2].innerHTML;
        var SelectSpecies = tempt.rows[1].cells[5].innerHTML;
        window.open('Disease_network.jsp?'+input_ncRNA+'&'+SelectSpecies,'_blank');
    })
</script>


</body>

</html>
