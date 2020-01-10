<%--
  Created by IntelliJ IDEA.
  User: wzhang
  Date: 11/9/18
  Time: 3:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html charset=UTF-8"  />
    <meta name="keywords" content="ncRPheno, database, noncoding RNA, ncRNA, miRNA, lncRNA, circRNA, disease, phenotype"/>
    <title>ncRPheno News</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">
    </script>


    <link rel="stylesheet" href="lib/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="lib/bootstrap/bootstrap-theme.min.css"/>
    <script src="lib/bootstrap/js/bootstrap.min.js"></script>

    <link href="static/css/innerstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--topMain start -->
<div><!--<div id="topMain">-->
    <!--top start -->

    <!--topMain end -->
    <!--navMain start -->

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
                <!--<h2><span class="main">Last News</span></h2>-->
                <!--<p class="round"><span>4 July,2018: The data in ncRPheDB was updated with 2,839 ncRNA-disease associations between 91 ncRNAs and 501 diseases/phenotypes. The total ncRNA-disease association number is increased to 143,680.</span></p>-->

                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h2 class="panel-title" style="color:#D27004">October 23, 2018: Oral presentation in CCSBS Symposium </h2>
                    </div>
                    <div class="panel-body">
                        The ncRPheno platform was presented in the 8th National Conference on Bioinformatics and Systems Biology of China and the 1st (Macao) International Bioinformatics Symposium in oral presentation session, Macao, China.
                    </div>
                </div>
                </br>

                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h2 class="panel-title" style="color:#D27004">September 20, 2018: A new version of ncRPheno was released</h2>
                    </div>
                    <div class="panel-body">
                        (1)	New data: circRNADisease and GWAS Catalog, the associations in ncRPheno are increased to 103,932 non-redundant associations;</br>
                        </br>(2) New annotations: disease-related SNPs annotated to ncRNAs; experimentally verified targets annotated to ncRNAs;</br>
                        </br>(3)	The confidence scoring model for prioritization of ncRNA-disease associations are refined; </br>
                        </br>(4)	New interface: tree structures to essay ncRNA and disease borowse; </br>
                        </br>(5)	New applications: Association submission webpage etc.; </br>
                        </br>(6)	New visualizations: disease-tree visualization, WordCloud visualization etc.; </br>
                    </div>
                <!--style for 多图片切换-->
                </div>
                </br>
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h2 class="panel-title" style="color:#D27004">June 25, 2018: ncRPheno version 1.0 has been released</h2>
                    </div>
                    <div class="panel-body">
                        The ncRPheno platform provides ncRNA and disease search, ncRNA and disease browse, RESTful Web service APIs and data Download etc. applications.
                    </div>
                    <!--style for 多图片切换-->
                </div>
                </br>
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h2 class="panel-title" style="color:#D27004">April 10, 2018: Poster presentation in Biocuration 2018</h2>
                    </div>
                    <div class="panel-body">
                        The ncRPheno platform was presented in the 11th International Biocuration Conference, Shanghai, China.
                    </div>

                    <!--style for 多图片切换-->
                </div>
                </br></br></br>
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
</body>
</html>