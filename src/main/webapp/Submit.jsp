<%--
  Created by IntelliJ IDEA.
  User: wzhang
  Date: 6/20/18
  Time: 11:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--<title>ncRPheDB_evidence</title>--%>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>ncRPheno Submission</title>
        <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">
        </script>

        <link rel="stylesheet" href="lib/bootstrap/css/bootstrap.min.css"/>
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

            <div id="right" style="min-height: 1000px">
                <h2><span class="main">Please submit your association data:</span></h2>
                <p align="justify" class="rightTxt" >
                    <span style="color:red;">*</span>
                    <b>Indicates required fields</b>
                </p>
                <%--<span class="contacttextarea"><span class="style4">* </span>indicates required fields</span></p><br>--%>
                <div class="contactTxt">

                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1" >*ncRNA Symbol</span>
                                <input id="ncRNA" type="text" class="form-control" placeholder="eg. hsa-mir-4651, NONHSAT003779, HOTAIR, hsa_circ_0002113, mmu-mir-697, rno-mir-141, circHIPK3
" aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon2">*Disease Name</span>
                                <input id="disease" type="text" class="form-control" placeholder="eg. Breast carcinoma, Rheumatic disease, Chronic lymphocytic leukemia, Papillary thyroid carcinoma
" aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon4">*Validations Methods</span>
                                <input id="methods" type="text" class="form-control" placeholder="eg. qPCR, Microarray, Northern blotting, Luciferase report assay, knockdown/overexpression, animal model
" aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon5">*PMID</span>
                                <input id="PMID"  type="text" class="form-control" placeholder="eg. 15689248, 28569742, 24012423
" aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group">
                                <span  class="input-group-addon" id="basic-addon6">Expression Pattern</span>
                                <input id="expression" type="text" class="form-control" placeholder="eg. upregulation, downregulation, regulation
" aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon7">Targets</span>
                                <input id="target"  type="text" class="form-control" placeholder="eg. hsa-mir-4651, NONHSAT003779, HOTAIR, TP53, EGFR, circHIPK3
" aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon8">SNPs</span>
                                <input id="SNP" type="text" class="form-control" placeholder="eg. rs354615, rs254978,rs3515687, rs4856978
" aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon9">Treatments</span>
                                <input id="treatment" type="text" class="form-control" placeholder="eg. Taxol, 5-FU, Pollution, Gleevec, Zoladex, ZofranODT
" aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group">
                            <span class="input-group-addon" id="basic-addon3">Sample Name</span>
                            <input id="sample" type="text" class="form-control" placeholder="eg. Breast tumor tissue, Colon cancer cell line, HCT-116 cell line, liver tissue
" aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon10">Description</span>
                                <%--<input type="text" class="form-control" aria-describedby="basic-addon1" style="height: 200px;">--%>
                                <textarea id= "description" class="form-control" style="height: 200px;" placeholder= "A briefing description for your submitting ncRNA-disease association
"></textarea>
                            </div>
                            <div>
                                <button type="button" class="btn btn-default btn-warning" style="margin-top: 30px;width: 400px;float: left" id="submit">
                                    <span>Submit</span>
                                </button>
                                <button type="button" class="btn btn-default btn-danger" style="margin-top: 30px;width: 400px;float: right;" id="clear" >
                                    <span>Reset all</span>
                                </button>
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
<script src="static/js/submit.js"></script>
<script src="static/js/reset.js"></script>
</body>
</html>
