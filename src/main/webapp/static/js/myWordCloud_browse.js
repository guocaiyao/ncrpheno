$(document).ready(function () {
    (function () {

        $('#patient').html('The word-cloud diagram is currently drawing... Please be patient.')

        var tempurl = location.search.split(/[?&]/);
        var reg = new RegExp("%20","g");//g,表示全部替换。
        var input_disease = tempurl[1].replace(reg," ");
        var SelectType = "All ncRNA types";
        console.log(input_disease);
        console.log(SelectType);
        var url = "ncrphedb/disease";
        console.log(url);
        var param = {
            input_D:input_disease,
            selectedR:SelectType
        };

        $.ajax({
            type:"post",
            url:url,
            dataType:"text",
            data:param,
            cache:false,
            success:function (res) {
                console.log(res);
                var res_json = $.parseJSON(res);
                var length = res_json.Results.length;
                console.log("length:"+length);

                //JSON transform to Table for html visualization of web Front
                if (length == 0){
                    $('#patient').html('')
                    alert("Sorry, there are no association for your input disease!!")

                } else {
                    $('#patient').html('')
                    var table_title_info = "<h3><span  style=\"color:#D27004\">" + res_json.Results[0].Disease_Name + " information:" + "</span></h3>"  //add table title for Disease-information
                    $('#title_information').html(table_title_info);

                    var Ontology_ID = res_json.Results[0].Ontology_ID
                    var sub_Ontology_ID = Ontology_ID.substr(0,2);
                    console.log(sub_Ontology_ID)

                    if(sub_Ontology_ID == 'HP'){
                        var html_str_info = "<tr><th>Disease_Name</th><td>" +res_json.Results[0].Disease_Name+"</td></tr>" +  "<tr><th>Ontology_ID</th><td><a target='_blank' href= https://www.ebi.ac.uk/ols/ontologies/hp/terms?iri=http%3A%2F%2Fpurl.obolibrary.org%2Fobo%2F" +res_json.Results[0].Ontology_ID + ">" +res_json.Results[0].Ontology_ID+"</a></td></tr>" +"<tr><th>Definition</th><td>" +res_json.Results[0].Definition+"</td></tr>"+ "<tr><th>Alternative_Name</th><td>" +res_json.Results[0].AlternativeName+"</td></tr>";

                    }else if(sub_Ontology_ID =='Or'){
                        var html_str_info = "<tr><th>Disease_Name</th><td>" +res_json.Results[0].Disease_Name+"</td></tr>" +  "<tr><th>Ontology_ID</th><td><a target='_blank' href= http://www.orpha.net/ORDO/" +res_json.Results[0].Ontology_ID + ">" +res_json.Results[0].Ontology_ID+"</a></td></tr>" +"<tr><th>Definition</th><td>" +res_json.Results[0].Definition+"</td></tr>"+ "<tr><th>Alternative_Name</th><td>" +res_json.Results[0].AlternativeName+"</td></tr>";

                    }else{
                        if(sub_Ontology_ID =='MO'){
                            var html_str_info = "<tr><th>Disease_Name</th><td>" +res_json.Results[0].Disease_Name+"</td></tr>" +  "<tr><th>Ontology_ID</th><td><a target='_blank' href= https://www.ebi.ac.uk/ols/ontologies/mondo/terms?iri=http%3A%2F%2Fpurl.obolibrary.org%2Fobo%2F" +res_json.Results[0].Ontology_ID + ">" +res_json.Results[0].Ontology_ID+"</a></td></tr>" +"<tr><th>Definition</th><td>" +res_json.Results[0].Definition+"</td></tr>"+ "<tr><th>Alternative_Name</th><td>" +res_json.Results[0].AlternativeName+"</td></tr>";

                        }else if(sub_Ontology_ID =='GO'){
                            var html_str_info = "<tr><th>Disease_Name</th><td>" +res_json.Results[0].Disease_Name+"</td></tr>" +  "<tr><th>Ontology_ID</th><td><a target='_blank' href= https://www.ebi.ac.uk/ols/ontologies/go/terms?iri=http%3A%2F%2Fpurl.obolibrary.org%2Fobo%2F" +res_json.Results[0].Ontology_ID + ">" +res_json.Results[0].Ontology_ID+"</a></td></tr>" +"<tr><th>Definition</th><td>" +res_json.Results[0].Definition+"</td></tr>"+ "<tr><th>Alternative_Name</th><td>" +res_json.Results[0].AlternativeName+"</td></tr>";

                        }else{
                            var html_str_info = "<tr><th>Disease_Name</th><td>" +res_json.Results[0].Disease_Name+"</td></tr>" +  "<tr><th>Ontology_ID</th><td><a target='_blank' href= https://www.ebi.ac.uk/ols/ontologies/efo/terms?iri=http%3A%2F%2Fwww.ebi.ac.uk%2Fefo%2F" +res_json.Results[0].Ontology_ID + ">" +res_json.Results[0].Ontology_ID+"</a></td></tr>" +"<tr><th>Definition</th><td>" +res_json.Results[0].Definition+"</td></tr>"+ "<tr><th>Alternative_Name</th><td>" +res_json.Results[0].AlternativeName+"</td></tr>";

                        }

                    }
                    // var html_str_info = "<tr><th>Disease_Name</th><td>" + res_json.Results[0].Disease_Name + "</td></tr>" + "<tr><th>Ontology_ID</th><td><a href=https://www.ebi.ac.uk/ols/ontologies/efo/terms?iri=http%3A%2F%2Fwww.ebi.ac.uk%2Fefo%2F" + res_json.Results[0].Ontology_ID + ">" + res_json.Results[0].Ontology_ID + "</a></td></tr>" + "<tr><th>Definition</th><td>" + res_json.Results[0].Definition + "</td></tr>" + "<tr><th>Alternative_Name</th><td>" + res_json.Results[0].AlternativeName + "</td></tr>" + "<tr><th>Cross_Reference</th><td>" + res_json.Results[0].Cross_Reference + "</td></tr>";


                    $('#table_information').html(html_str_info);
                    var table_title_ass = "<h3><span style=\"color:#D27004\">The prioritized ncRNAs dysregulation profile of " + res_json.Results[0].Disease_Name + ", total " + length + " assoications:</span></h3>"//add table title for association
                    $('#title_association').html(table_title_ass);
                    var note = "<span style=\"color:#D21004\">(Note: Each ncRNA symbol in the Word-Cloud diagram links to further webpages for more evidential and biomedical information from publications; you can right click to save the WordCloud diagram)</span>";
                    $('#note').html(note);


                    var toDisplay = new Array();
                    for (var i = 0; i < res_json.Results.length; i++) {
                        toDisplay[i] = new Array();
                        toDisplay[i][0] = res_json.Results[i].ncRNA_Symbol;

                        toDisplay[i][1] = res_json.Results[i].Score;
                        toDisplay[i][2] = res_json.Results[i].ncRPheDB_ID;
                        // toDisplay[i][3] = res_json.Results[i].Disease_Name;
                    }
                    console.log("lengths:" + length);




                    if(length<=300){
                        $('#canvas-container').css('height', '750px');
                        console.log("lengthss:" + length);
                    }else{
                        $('#canvas-container').css('height', '1500px');
                        console.log("lengthss:" + length);
                    }

                    // document.getElementById("canvas").width = 1200;
                    // document.getElementById("canvas").height = 1200;



                    var wc = new Js2WordCloud(document.getElementById('canvas-container'))
                    wc.setOption({
                        tooltip: {
                            show: true,
                            formatter: function(item) {
                                return 'ncRNA: ' + item[0] + '<br>' + 'Score: ' + item[1];
                            }
                        },
                        list: toDisplay,
                        color: 'random-dark',
                        fontFamily: 'Arial',
                        minFontSize: 10,
                        maxFontSize: 30,
                        rotateRatio: 0,

                        fontWeight: 'bold',
                        click: function(item) {
                            //window.open('https://www.baidu.com/s?ie=utf-8&f=8&rsv_bp=1&ch=&tn=baiduerr&bar=&wd='+item[0]+item[1], '_blank');
                            window.open('Association.jsp?id='+item[2], '_blank')
                        }
                    })

                    wc.resize();



                    $("#imgSave").css("visibility", "visible");//seting visibility
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log("Failed");
            }
        });
    }())
})