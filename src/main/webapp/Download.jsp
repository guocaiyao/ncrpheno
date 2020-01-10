<%--
  Created by IntelliJ IDEA.
  User: wzhang
  Date: 6/20/18
  Time: 11:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--<title>ncRPheDB_evidence</title>--%>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>ncRPheno Download</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">
    </script>

    <<link rel="stylesheet" href="lib/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="lib/bootstrap/bootstrap-theme.min.css"/>
    <script src="lib/bootstrap/js/bootstrap.min.js"></script>
    <link href="static/css/innerstyle.css" rel="stylesheet" type="text/css" />
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

                <h2><span class="main">ncRPheno data download:</span></h2>
                <%--<h3>ncRPheDB data download:</h3><br>--%>
                <p align="justify" class="rightTxt">All association data in ncRPheno can be freely downloaded for academic purposes.</p><br>

                <table id="tabletoDL" border="1" style="width: 1200px" class="table table-striped table-bordered table-hover table-condensed">
                    <tr><th>ncRPheno data</th><th>Description</th></tr>
                    <tr><td><a href="static/ncRPheDB_Data/ncRNA_Diseas_association.txt" download="">ncRNA -disease phenotype association.txt</a></td><td>The core association data in ncRPheno includes Disease parent, Association id, Disease name, Disease ontology, ncRNA, ncRNA type, Association score etc.</td>
                    <tr><td><a href="static/ncRPheDB_Data/ncRNA_information.txt" download="">ncRNA information.txt</a></td><td>The detailed data of ncRNA includes ncRNA name, ncRNA type, Species, ncRNA identification, SNPs, Targets etc.</td>
                    <tr><td><a href="static/ncRPheDB_Data/Disease_information.txt" download="">Disease phenotype information.txt</a></td><td>The detailed data of disease phenotype includes disease phenotype name, ontology ID, definition, alterative name, cross reference, etc.</td>
                    <tr><td><a href="static/ncRPheDB_Data/Evidence_information.txt" download="">Evidence information in publications.txt</a></td><td>The detailed data in publication for supporting the associations includes Assocition id, ncRNA, PMID, Disease expression pattern, ECO id: definition, Method, Sample, Target, Treatment, Description, Source, Publication title etc.</td>

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
<script src="lib/Jquery.min.js"></script>
<%--<script>arttemplate.js</script>--%>
<script src = "static/js/Association.js"></script>
</body>

</html>
