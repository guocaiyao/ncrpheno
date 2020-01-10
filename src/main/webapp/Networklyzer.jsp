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
    <title>ncRPheno network visualization</title>

    <script src="lib/jquery.min.js"></script>
    <script src="lib/fuzzySearch/prettify.js" type="text/javascript"></script>
    <script src="lib/fuzzySearch/bootstrap-typeahead.js" type="text/javascript"></script>

    <link rel="stylesheet" href="lib/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="lib/bootstrap/bootstrap-theme.css"/>
    <script src="lib/bootstrap/js/bootstrap.min.js"></script>


    <script src="lib/fuzzySearch/mockjax.js" type="text/javascript"></script>

    <script src="lib/fuzzySearch/fuzzySearch_all_search.js" type="text/javascript"></script>


    <link href="static/css/innerstyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="lib/vis-master-vis.js/dist/vis.js"></script>
    <link href="lib/vis-master-vis.js/dist/vis-network.min.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        #mynetwork {
            width: 1100px;
            height: 900px;
            border: 2px solid lightgray;
        }
        #loadingBar {
            position:absolute;
            top:0px;
            left:0px;
            width: 1102px;
            height: 902px;
            background-color:rgba(200,200,200,0.8);
            -webkit-transition: all 0.5s ease;
            -moz-transition: all 0.5s ease;
            -ms-transition: all 0.5s ease;
            -o-transition: all 0.5s ease;
            transition: all 0.5s ease;
            opacity:1;
        }
        #wrapper {
            position:relative;
            width:900px;
            height:900px;
        }

        #text {
            position:absolute;
            top:8px;
            left:530px;
            width:30px;
            height:50px;
            margin:auto auto auto auto;
            font-size:22px;
            color: #000000;
        }


        div.outerBorder {
            position:relative;
            top:400px;
            width:600px;
            height:44px;
            margin:auto auto auto auto;
            border:8px solid rgba(0,0,0,0.1);
            background: rgb(252,252,252); /* Old browsers */
            background: -moz-linear-gradient(top,  rgba(252,252,252,1) 0%, rgba(237,237,237,1) 100%); /* FF3.6+ */
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(252,252,252,1)), color-stop(100%,rgba(237,237,237,1))); /* Chrome,Safari4+ */
            background: -webkit-linear-gradient(top,  rgba(252,252,252,1) 0%,rgba(237,237,237,1) 100%); /* Chrome10+,Safari5.1+ */
            background: -o-linear-gradient(top,  rgba(252,252,252,1) 0%,rgba(237,237,237,1) 100%); /* Opera 11.10+ */
            background: -ms-linear-gradient(top,  rgba(252,252,252,1) 0%,rgba(237,237,237,1) 100%); /* IE10+ */
            background: linear-gradient(to bottom,  rgba(252,252,252,1) 0%,rgba(237,237,237,1) 100%); /* W3C */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fcfcfc', endColorstr='#ededed',GradientType=0 ); /* IE6-9 */
            border-radius:72px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.2);
        }

        #border {
            position:absolute;
            top:10px;
            left:10px;
            width:500px;
            height:23px;
            margin:auto auto auto auto;
            box-shadow: 0px 0px 4px rgba(0,0,0,0.2);
            border-radius:10px;
        }

        #bar {
            position:absolute;
            top:0px;
            left:0px;
            width:20px;
            height:20px;
            margin:auto auto auto auto;
            border-radius:11px;
            border:2px solid rgba(30,30,30,0.05);
            background: rgb(0, 173, 246); /* Old browsers */
            box-shadow: 2px 0px 4px rgba(0,0,0,0.4);
        }
    </style>

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
                <h2><span class="main">Please build a set of disease phenotypes or ncRNAs with comma delimited:</span></h2>
                <%--<p>Please input a disease:</p><br>--%>
                <textarea id="txtVal" style="width:1150px;height:50px;" class="form-control"  readOnly="true"  ></textarea>
                <br>
                <input type="text" name="" id="newAdd" placeholder="Please enter disease or ncRNA and click [add] button." class="form-control" style="width: 400px; display: inline" >
                <button onclick="getVal()" type="button" class="btn btn-warning" style="width: 100px;margin-left: 20px; display: inline" >Add</button>
                <button onclick="getexample2()" type="button" class="btn btn-warning" style="margin-left: 30px; width:100px; display: inline" >Example1</button>

                <button onclick="getexample1()" type="button" class="btn btn-warning" style="margin-left: 30px; width:100px; display: inline" >Example2</button><br>

                <%--<button id="Search" type="button" class="btn btn-warning" style="margin-left: 20px" >Network analysis</button><br>--%>
                <%--<p>e.g.: Breast carcinoma; Cardiovascular disease; Type ii diabetes mellitus; Rheumatoid arthritis</p><br>--%>

                <br>



                <%--<input id="Threshold" type="text"  placeholder="Please sets a threshold of association score range from 0 to 1." class="form-control" style="width: 500px; display: inline" >--%>
                <select id="Threshold" class="form-control" style="width:300px; display: inline;" value="Data category">
                    <option  selected = "selected" >---Please set threshold---</option>
                    <option  >0.0</option>
                    <option  >0.1</option>
                    <option  >0.2</option>
                    <option  >0.3</option>
                    <option  >0.4</option>
                    <option  >0.5</option>
                    <option  >0.6</option>
                    <option  >0.7</option>
                    <option  >0.8</option>
                    <option  >0.9</option>

                </select>
                <%--<button   class="btn btn-warning" style="width: 100px;margin-left: 20px; " >Threshold</button><br><br>--%>

                <select id="SelectType" class="form-control" style="margin-left: 20px;width: 300px;display: inline;" value="Data category">
                    <option  selected = "selected" >---Please select data category---</option>
                    <option  >Diseases</option>
                    <option>ncRNAs</option>
                </select>


                <select id="SelectSpecies" class="form-control" style="margin-left: 20px;width: 300px; display: inline;">
                    <option selected = "selected">---Please select species---</option>
                    <option>Homo sapiens</option>
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
                <button   class="btn btn-warning" style="width: 150px;margin-left: 20px; " >Set parameters</button>
            <%--<select id="Threshold" class="form-control" style="width: 450px; display: inline;" value="Data category">--%>
                    <%--<option  selected = "selected" >---Please sets threshold of association score---</option>--%>
                    <%--<option  >0.2</option>--%>
                    <%--<option>0.4</option>--%>
                    <%--<option>0.5</option>--%>
                    <%--<option>0.6</option>--%>
                    <%--<option>0.8</option>--%>
                    <%--<option>0.4</option>--%>

                <div>
                    <button id="Search" type="button" class="btn btn-default btn-warning" style="margin-top: 30px;width: 300px;display: inline">Run</button>
                    <button  id="clear" type="button" class="btn btn-default btn-danger" style="margin-top: 30px;width: 300px;margin-left: 40px">Reset all</button>
                </div>

<br>
                <h2 id = 'NetworkResult'></h2>
                <p style="font-size:20px;color:blue" id="patient"></p>
                <p style="font-size:20px;color:blue" id="lower_threshold"></p>
                <img id ='Legend_figure' style="visibility: hidden;" src="static/images/network_legend.png"  height="40" width="400"/>
                <p style="font-size:14px;color:blue" id="Legend_text"></p>


                <div id="wrapper">


                </div>


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
<script src="static/js/Networklyzer.js" type="text/javascript"></script>
<script type="text/javascript">
    function getVal(){
        var newAdd=document.getElementById('newAdd').value;
        document.getElementById('txtVal').value+=newAdd+",";
    }
</script>
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
<script type="text/javascript">
    function getexample1(){

        var example1 = 'CCND1,HSA_CIRC_0003570,HSA-MIR-3007A,HSA-MIR-1268A,'
        // var example1= "hsa-let-7b"
        document.getElementById('txtVal').value+=example1;
        var a = document.getElementById("SelectType");
        a.options[2].selected = true;
        var b = document.getElementById("Threshold");
        b.options[2].selected = true;
        // document.getElementById('input_disease').value+=example2;
        var c = document.getElementById("SelectSpecies");
        c.options[1].selected = true;
        // document.getElementById('input_disease').value+=example2;
    }
    function getexample2(){

        var example1 = 'Ovarian serous carcinoma,Ovarian adenocarcinoma,Ovarian serous tumor,'
        // var example1= "hsa-let-7b"
        document.getElementById('txtVal').value+=example1;
        var a = document.getElementById("SelectType");
        a.options[1].selected = true;
        var b = document.getElementById("Threshold");
        b.options[2].selected = true;
        // document.getElementById('input_disease').value+=example2;
        var c = document.getElementById("SelectSpecies");
        c.options[1].selected = true;
        // document.getElementById('input_disease').value+=example2;
    }

</script>
</body>
</html>
