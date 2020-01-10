<%--
  Created by IntelliJ IDEA.
  User: wzhang
  Date: 6/25/18
  Time: 9:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--<title>ncRPheDB_evidence</title>--%>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>ncRPheno Help</title>
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


                <div id = 'detail information' style="width: 1150px;" class="panel panel-info">
                    <div class="panel-heading">
                        <h2 class="panel-title" style="color:#D27004">A detailed tutorial for ncRPheno</h2>
                    </div>
                    <div class="panel-body">
                        <p  style="text-align:justify; text-justify:inter-ideograph;">
                            1. <a  href = "#about">About ncRPheno</a>
                        </p>

                        <p  style="text-align:justify; text-justify:inter-ideograph;">
                            2. <a href = "#web">ncRPheno web interfaces</a>
                        </p>

                        <p  style="text-align:justify; text-justify:inter-ideograph;">
                            2.1. <a  href = "#browse"> Browse and search</a>
                        </p>

                        <p style="text-align:justify; text-justify:inter-ideograph;">
                            2.2. <a  href="#prioritization"> ncRNA prioritization application</a>
                        </p>

                        <p style="text-align:justify; text-justify:inter-ideograph;">
                            2.3. <a  href="#network">Network visualization application</a>
                        </p>

                        <p style="text-align:justify; text-justify:inter-ideograph;">
                            2.4. <a  href="#other">Other application interface</a>
                        </p>
                        <p  style="text-align:justify; text-justify:inter-ideograph;">
                            3. <a  href = "#score">Computation of association score</a>
                        </p>

                        <p  style="text-align:justify; text-justify:inter-ideograph;">
                            4. <a  href = "#data">Data attribute</a>
                        </p>
                        <p  style="text-align:justify; text-justify:inter-ideograph;">
                            5. <a  href = "#contact">Contact us</a>
                        </p>

                    </div>
                </div><br>



                <div class="Wallop-item">
                    <h2 id = "about"><span class="main">1. About ncRPheno </span></h2>
                    <div style=" border:3px solid;color:#D27004" ></div>

                    <p align="justify" class="rightTxt">
                        <b>ncRPheno</b> is a comprehensive database platform that provides experimentally supported associations between noncoding RNAs (ncRNAs, including miRNA, lncRNA, circRNA, snoRNA and piRNA etc.) and disease phenotypes across 11 species (including <i>Homo sapiens</i>, <i>Mus musculus</i>, <i>Rattus norvegicus</i>, <i>Macaca mulatta</i>, <i>Sus scrofa</i>, <i>Pan troglodytes</i>, <i>Marmoset</i>, <i>Gallus gallus</i>, <i>Canis familiaris</i>, <i>Zebrafish</i> and <i>Rabbit</i>). ncRNAs have been experimentally validated as a novel class of biomarkers and potential drug targets for disease diagnosis, therapy and prognosis. The discovery of relationships between ncRNAs and disease phenotypes has become increasingly important. ncRPheno provides experimentally validated associations between ncRNAs and disease phenotypes through homogenizing integration of the association data from about 20 manually curated databases. ncRPheno provides user-friendly web interfaces and RESTful application programming interfaces for users to browse, search, prioritize, analyze and access data freely.
                    </p>

                </div>
                <div class="Wallop-item">
                    <h2 id = "web"><span class="main">2. The ncRPheno web interfaces</span></h2>
                    <div style=" border:3px solid;color:#D27004" ></div>

                    <p align="justify" class="rightTxt">
                        The ncRPheno database platform has been tested on <b>Firefox 68.0, Google Chrome 61 and Safari</b>.
                    </p>
                    <br>
                    <p id ='browse' align="justify" class="rightTxt"><b>2.1 Browse and search:</b></p>


                    <div style=" border:1px solid;color:#D27004" ></div>
                    <p align="justify" class="rightTxt">
                        The ‘Browse’ webpage and ‘Search’ webpages in ncRPheno allow users to quickly retrieve ncRNA-disease associations through searching ncRNA and disease phenotype. The resulting association data is displayed in a brief table, showing key information of association identifiers (IDs), ncRNA symbols, disease phenotypes with ontology identifier and association scores for prioritization <b> (Figure 1A)</b>. The resulting association data of the disease search allows to optionally visualize in a word-cloud diagram <b> (Figure 1B)</b>. Similarly, the resulting association data of the ncRNA search allows to optionally visualize in a disease-tree or -network diagram <b> (Figure 1C and D)</b>. The association IDs in the table <b> (Figure 1A)</b>, ncRNA symbols in the word-cloud diagram <b> (Figure 1B)</b> and circle nodes in the disease-tree diagram <b> (Figure 1C)</b> link to further information of ncRNA, disease phenotype and the supporting evidences in publications <b> (Figure 1E)</b>. External links to other reference resources are also provided such as PubMed, miRBase, Ensembl, EFO etc. <b> (Figure 1E)</b>.
                    </p>

                    <center>
                        <img src="static/images/Figure1_help.png"  height="800" width="1100"/>
                    </center>

                    <br>
                    <p id = "prioritization" align="justify" class="rightTxt"><b>2.2 ncRNA prioritization application:</b></p>

                    <div style=" border:1px solid;color:#D27004" ></div>
                    <p align="justify" class="rightTxt">
                        To assist to identify disease-related ncRNAs from large-scale ncRNAs, a ncRNA prioritization application was implemented in ncRPheno to prioritize a set of ncRNAs to a corresponding disease phenotype. The resulting table allows sorting by association scores and filtering by specific ncRNA <b> (Figure 2) </b>, and links to further webpages for detailed information.                    </p>

                    <center>
                        <img src="static/images/Figure2_help.png"  height="650" width="950"/>
                    </center>

                    <br>
                    <p id = "network" align="justify" class="rightTxt"><b>2.3 Network visualization application:</b></p>

                    <div style=" border:1px solid;color:#D27004" ></div>

                    <p align="justify" class="rightTxt">
                        A network visualization application was implemented in ncRPheo to explore the relationships between different diseases and ncRNAs. The application allows user to enter a set of diseases or ncRNAs, and to generate interaction network to display the association data <b> (Figure 3) </b>.
                    </p>


                    <center>
                        <img src="static/images/Figure3_help.png"  height="750" width="850"/>
                    </center>

                    <br>

                    <p id = "other" align="justify" class="rightTxt"><b>2.4 Other application interface:</b></p>

                    <div style=" border:1px solid;color:#D27004" ></div>
                    <p align="justify" class="rightTxt">
                        The website also offers RESTful application programming interfaces (APIs) to access the data programmatically. All resources are accessible through simple RESTful URLs by querying and retrieving an individual entry as well as sets of entries. Output data are available in universal JSON and text formats. Documentation of APIs are available online. All association data in ncRPheno can be freely downloaded. In addition, ncRPheno encourages users to submit their new association data for future data integration. Once checked by our professional curators and approved by the submission review committee, the submitted records will be included in a future release. Furthermore, a detailed tutorial is available on the ‘Help’ webpage.                    </p>


                    <div class="Wallop-item">
                        <h2 id = "score"><span class="main">3. Computation of association score</span></h2>
                        <div style=" border:3px solid;color:#D27004" ></div>

                        <p align="justify" class="rightTxt">
                            Experimental evidences in publications such as experiment methods, number of publications and diseases parent-child relationships have been included to support the associations. An association scoring model has been established based on these evidential metrics and integrated in ncRPheno to prioritize and interpret the ncRNA dysregulation-disease associations. The association scoring model consists of four steps to compute the association scores.
                        </p>

                        <center>
                            <img src="static/images/Table1.png"  height="450" width="700"/>
                        </center>
                        <br>

                        <p align="justify" class="rightTxt">
                            <b>Step 1: </b>The experiment methods indicated in publications were annotated with the categories of <a href="https://www.ebi.ac.uk/ols/ontologies/eco" target="_blank">Evidence & Conclusion Ontology (ECO)</a>, and then classified into different evidential levels, including high-throughput expression level, low-throughput expression level, function and mechanism analysis level, <i>in vivo</i> analysis level, etc. <b> (Table 1) </b>. Each evidential level was given with an experiment score (<i>Ee</i>) according to their reliability. In principle, experiment methods for <i>in vivo</i> analysis, mechanism and functional analysis provide more reliable evidence than RNA expression experiments. Therefore, different experiment methods in publications are empirically defined and detailed in <b> Table 1)</b>. The evidential value (<i>Ep</i>) of a supporting publication for a ncRNA-disease association is summed up with experiment scores (<i>Ee</i>) as the following equation [1]:
                        </p>

                        <center>
                            <img src="static/images/step1.png"  height=25 width="200"/>
                        </center>
                        <br>
                        <p align="justify" class="rightTxt">
                            In equation [1], ‘<i>n</i>’ represents the total number of supporting experiment methods in the publication, and <i>Eei</i> is the experiment score for a supporting experiment method ‘i’ in the publication.
                        </p>


                        <p align="justify" class="rightTxt">
                            <b>Step 2: </b>A larger number of publications can enhance the evidential values for the same ncRNA-disease association. The evidential value (E) of an association with multiple supporting publications is derived by using a harmonic sum function (<a target='_blank' href="https://www.ncbi.nlm.nih.gov/pubmed/19107201">PMID:19107201</a>, <a target='_blank' href="https://www.ncbi.nlm.nih.gov/pubmed/27899665">PMID:27899665</a>), not only to account for replication but also to dampen the effect of a large number of publications by calculating as the following equation:
                        </p>
                        <center>
                            <img src="static/images/step2.png"  height="30" width="300"/>
                        </center>
                        <br>

                        <p align="justify" class="rightTxt">
                            In equation [2], ‘<i>m</i>’ represents the total number of supporting publications, and <i>Ep1</i>, <i>Ep2</i>, <i>Ep3</i>, …, <i>Epm</i> are the sorted evidential values of different supporting publications in descending order.
                        </p>


                        <p align="justify" class="rightTxt">
                            <%--<b>Step 3: </b>Normalizing the overall evidential score (E) to limit the range of final association scores from 0 to 1.0.--%>
                            <b>Step 3: </b>Only the disease subclasses with direct supporting publications can propagate the evidences along the parental nodes. For example, in the EFO database, “non-small cell lung adenocarcinoma” is a subtype of “non-small cell lung carcinoma”, which is a subtype of “lung carcinoma”. When “non-small cell lung adenocarcinoma” and “non-small cell lung carcinoma” have directly supporting evidences from publications, both evidences can be propagated to “lung carcinoma”. Similarly, other evidence information can be derived based on the EFO data. Therefore, take into consideration all the inferred evidences of EFO parent-child relationships and properties, a final evidential value (<i>F</i>) is computed by using a harmonic sum function(<a target='_blank' href="https://www.ncbi.nlm.nih.gov/pubmed/19107201">PMID:19107201</a>, <a target='_blank' href="https://www.ncbi.nlm.nih.gov/pubmed/27899665">PMID:27899665</a>), not only to account for replication but also to dampen the effect of a large number of inferred evidences by calculating as the following equation:

                        </p>
                        <center>
                            <img src="static/images/step3.png"  height="35" width="300"/>
                        </center>
                        <br>
                        <p align="justify" class="rightTxt">

                            In equation [3], ‘<i>j</i>’ represents the number of all of disease subclasses and itself, and <i>E1</i>, <i>E2</i>, <i>E3</i>, …, <i>Ej</i> are the sorted evidential values of disease subclasses and itself in descending order.                        </p>

                        <p align="justify" class="rightTxt">
                            <b>Step 4: </b>The final evidential value (<i>F</i>) above is normalized to limit the range of final association scores (<i>Score</i>) from 0 to 1.0.
                        </p>
                        <center>
                            <img src="static/images/step4.png"  height="40" width="230"/>
                        </center>
                        <br>
                        <p align="justify" class="rightTxt">
                            In equation [4], ‘<i>e</i>’ represents the natural constant <i>e</i>.
                        </p>

                    </div>


                    <div class="Wallop-item">
                        <h2 id = "data"><span class="main">4. Data attribute</span></h2>
                        <div style=" border:3px solid;color:#D27004" ></div>
                        <p align="justify" class="rightTxt">
                            The following information can help you to interpret ncRNA-disease associations.
                        </p>
                        <p align="justify" class="rightTxt">
                            <b>ncRNA</b>
                        </p>
                        <p align="justify" class="rightTxt">
                            To make the ncRNA symbols more consistent with other databases, ncRPheno provides both the identifiers and links for the miRNAs in the <a target='_blank'  href="http://www.mirbase.org/">miRBase</a> database, the lncRNAs in the <a target='_blank'  href=" http://asia.ensembl.org/index.html"> Ensembl</a> and <a target='_blank'  href=" https://rnacentral.org/">RNAcentral</a> database, the piRNA in the <a target='_blank'  href="http://www.regulatoryrna.org/database/piRNA/">piRBase</a>, the snoRNAs in the <a target='_blank'  href="https://rnacentral.org/"> RNAcentral </a> and <a target='_blank'  href=" https://www-snorna.biotoul.fr/aide.php"> snoRNA-LBME-db</a> database.                        </p>

                        <p align="justify" class="rightTxt">
                            <b>Disease phenotype</b>
                        </p>
                        <p align="justify" class="rightTxt">
                            To make the disease phenotypes more consistent with other databases, ncRPheno provides both the identifiers and links for the disease phenotypes in the <a target='_blank'  href="https://www.ebi.ac.uk/ols/index">EMBL-EBI Ontology Lookup Service</a> resources, including <a target='_blank'  href="https://www.ebi.ac.uk/ols/ontologies/efo">Experimental Factor Ontology (EFO)</a>, <a target='_blank'  href="https://www.ebi.ac.uk/ols/ontologies/ordo">Orphanet Rare Disease Ontology (ORDO)</a>, <a target='_blank'  href="https://www.ebi.ac.uk/ols/ontologies/hp">Human Phenotype Ontology (HPO)</a>, <a target='_blank'  href="https://www.ebi.ac.uk/ols/ontologies/doid">Human Disease Ontology (HDO)</a> and <a href="https://www.ebi.ac.uk/ols/ontologies/ncit" target="_blank" > NCI Thesaurus OBO Edition (NCIT) </a> etc. The majority of diseases phenotypes in ncRPheno are annotated by <a href="https://www.ebi.ac.uk/ols/ontologies/efo" target="_blank">EFO</a>, while the rest disease phenotypes, which EFO does not cover, are annotated by other ontologies.
                        </p>
                    </div>

                    <div class="Wallop-item">
                        <h2 id = "contact"><span class="main">5. Contact us</span></h2>
                        <div style=" border:3px solid;color:#D27004" ></div>
                        <p align="justify" class="rightTxt">
                            If you have any inquiries, please do not hesitate to contact us via email: <b>liweizhong@mail.sysu.edu.cn or
                            zhangwl25@mail2.sysu.edu.cn</b>
                        </p>
                    </div>
                    <%--back to top--%>
                    <div id="return-top" class="top_e">
                        <img src="static/images/backToTop.png" width="60" id="img" >
                        <div style="width:80px;margin:auto;">
                            <p id='font' style="font-size:15px;margin-left:2px;margin-top: 7.5px;display:none;">Back to<br>the top</p>
                        </div>
                    </div>


                </div>

            </div>
            <!--rigbr panel end -->
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
<script src="static/js/Disease_search.js" type="text/javascript"></script>
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

