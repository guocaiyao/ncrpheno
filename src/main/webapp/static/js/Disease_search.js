$(document).ready(function () {
    $('#Search').click(function(){
        $('#table_head').html('')
        if ($('#tabletoDL').hasClass('dataTable')) {
            var oldTable = $('#tabletoDL').dataTable();
            oldTable.fnClearTable(); //清空一下table
            oldTable.fnDestroy(); //还原初始化了的dataTable
            // $('#tabletoDL').empty();
        }

        $('#patient').html('')
        $('#title_association').html('')

        $("#toWordle").css("visibility", "hidden");

        $("#dtBtn").css("visibility", "hidden");
        $("#toTreeview").css("visibility", "hidden");

        $('#patient').html('Your search is currently running... please be patient.')


        var url = "ncrphedb/disease";
        //var symbol = "%" + $("#ncrna").val() + "%";//receive dynamic input
        var input_disease = $("#input_disease").val();
        var SelectType = $("#SelectType").val();
        // var SelectSpecies = $("#SelectSpecies").val();
        console.log(url);
        var param = {
            input_D:input_disease,
            selectedR:SelectType
            // selectedS:SelectSpecies

        };

        $.ajax({
            type:"post",
            url:url,
            dataType:"text",
            data:param,
            cache:false,
            success:function (res) {
                var res_json = $.parseJSON(res);
                var length = res_json.Results.length;

                //JSON transform to Table for html visualization of web Front
                if (length == 0){
                    $('#patient').html('')

                    var table_title_ass = "<h3><span style=\"color:#D27004\">In total of "+length+" association(s):</span></h3>"//add table title for association

                    $('#title_association').html(table_title_ass);



                    var  html_str_table_head= "<tr><th>No.</th>th><th>Association_ID</th><th>ncRNA_Symbol</th><th>Category</th><th>Disease phenotype (Ontology ID)</th><th>Association score</th></tr>";
                    $('#table_head').html(html_str_table_head);

                    var html_str_ass =''
                    $('#table_association').html(html_str_ass);

                    $("#dtBtn").css("visibility", "visible");
                    $("#toWordle").css("visibility", "hidden");
                    $('#tabletoDL').dataTable();
                    $('#tabletoDL')

                    alert("Sorry, there is no association for your input disease, please check your entered disease or selected ncRNA types!!")

                } else{

                    $('#patient').html('')

                    var table_title_ass = "<h3><span style=\"color:#D27004\">The prioritized ncRNA dysregulation profile of "+ res_json.Results[0].Disease_Name +", in total of "+length+" association(s):</span></h3>"//add table title for association

                    $('#title_association').html(table_title_ass);



                    var  html_str_table_head= "<tr><th>No.</th>th><th>Association_ID</th><th>ncRNA_Symbol</th><th>Category</th><th>Disease phenotype (Ontology ID)</th><th>Species</th><th>Association score</th></tr>";
                    $('#table_head').html(html_str_table_head);

                    var html_str_ass =''

                    for(var i=0;i<res_json.Results.length;i++) //the length of the json text
                    {
                        var Ontology_ID = res_json.Results[i].disease.ontology_ID
                        var sub_Ontology_ID = Ontology_ID.substr(0, 2);
                        console.log(sub_Ontology_ID)

                        if (sub_Ontology_ID == 'HP') {
                            // var html_str_info = "<tr><th>Disease_Name</th><td>" +res_json.Results[0].Disease_Name+"</td></tr>" +  "<tr><th>Ontology_ID</th><td><a href=https://www.ebi.ac.uk/ols/ontologies/efo/terms?iri=http%3A%2F%2Fwww.ebi.ac.uk%2Fefo%2F" +res_json.Results[0].Ontology_ID + ">" +res_json.Results[0].Ontology_ID+"</a></td></tr>" +"<tr><th>Definition</th><td>" +res_json.Results[0].Definition+"</td></tr>"+ "<tr><th>Alternative_Name</th><td>" +res_json.Results[0].AlternativeName+"</td></tr>"+ "<tr><th>Cross_Reference</th><td>" +res_json.Results[0].Cross_Reference+"</td></tr>";
                            html_str_ass += "<tr><td>" + (i + 1) + "</td>><td><a target='_blank' href='Association.jsp?id=" + res_json.Results[i].ncRPheDB_ID + "'>" + res_json.Results[i].ncRPheDB_ID + "</a></td><td>" + res_json.Results[i].ncRNA_Symbol + "</td><td>" + res_json.Results[i].Category + "</td><td>" + res_json.Results[i].Disease_Name + "(<a target='_blank' href= https://www.ebi.ac.uk/ols/ontologies/hp/terms?iri=http%3A%2F%2Fpurl.obolibrary.org%2Fobo%2F" + res_json.Results[i].Ontology_ID + ">" + res_json.Results[i].Ontology_ID + "</a>)</td><td>" + res_json.Results[i].Species + "</td><td>" + res_json.Results[i].Score + "</td></tr>";

                        } else if (sub_Ontology_ID == 'Or') {
                            // var html_str_info = "<tr><th>Disease_Name</th><td>" +res_json.Results[0].Disease_Name+"</td></tr>" +  "<tr><th>Ontology_ID</th><td><a href= http://www.orpha.net/ORDO/" +res_json.Results[0].Ontology_ID + ">" +res_json.Results[0].Ontology_ID+"</a></td></tr>" +"<tr><th>Definition</th><td>" +res_json.Results[0].Definition+"</td></tr>"+ "<tr><th>Alternative_Name</th><td>" +res_json.Results[0].AlternativeName+"</td></tr>"+ "<tr><th>Cross_Reference</th><td>" +res_json.Results[0].Cross_Reference+"</td></tr>";
                            html_str_ass += "<tr><td>" + (i + 1) + "</td>><td><a target='_blank' href='Association.jsp?id=" + res_json.Results[i].ncRPheDB_ID + "'>" + res_json.Results[i].ncRPheDB_ID + "</a></td><td>" + res_json.Results[i].ncRNA_Symbol + "</td><td>" + res_json.Results[i].Category + "</td><td>" + res_json.Results[i].Disease_Name + "(<a target='_blank' href=http://www.orpha.net/ORDO/" + res_json.Results[i].Ontology_ID + ">" + res_json.Results[i].Ontology_ID + "</a>)</td><td>" + res_json.Results[i].Species + "</td><td>" + res_json.Results[i].Score + "</td></tr>";

                        }else {
                            if(sub_Ontology_ID =='MO'){
                                html_str_ass += "<tr><td>" + (i + 1) + "</td>><td><a target='_blank' href='Association.jsp?id=" + res_json.Results[i].ncRPheDB_ID + "'>" + res_json.Results[i].ncRPheDB_ID + "</a></td><td>" + res_json.Results[i].ncRNA_Symbol + "</td><td>" + res_json.Results[i].Category + "</td><td>" + res_json.Results[i].Disease_Name + "(<a target='_blank'  href=https://www.ebi.ac.uk/ols/ontologies/mondo/terms?iri=http%3A%2F%2Fpurl.obolibrary.org%2Fobo%2F" + res_json.Results[i].Ontology_ID + ">" + res_json.Results[i].Ontology_ID + "</a>)</td><td>" + res_json.Results[i].Species + "</td><td>" + res_json.Results[i].Score + "</td></tr>";

                            }else if(sub_Ontology_ID =='GO'){
                                html_str_ass += "<tr><td>" + (i + 1) + "</td>><td><a target='_blank' href='Association.jsp?id=" + res_json.Results[i].ncRPheDB_ID + "'>" + res_json.Results[i].ncRPheDB_ID + "</a></td><td>" + res_json.Results[i].ncRNA_Symbol + "</td><td>" + res_json.Results[i].Category + "</td><td>" + res_json.Results[i].Disease_Name + "(<a target='_blank'  href=https://www.ebi.ac.uk/ols/ontologies/go/terms?iri=http%3A%2F%2Fpurl.obolibrary.org%2Fobo%2F" + res_json.Results[i].Ontology_ID + ">" + res_json.Results[i].Ontology_ID + "</a>)</td><td>" + res_json.Results[i].Species + "</td><td>" + res_json.Results[i].Score + "</td></tr>";

                            }else{
                                // var html_str_info = "<tr><th>Disease_Name</th><td>" +res_json.Results[0].Disease_Name+"</td></tr>" +  "<tr><th>Ontology_ID</th><td><a href= http://purl.obolibrary.org/obo/" +res_json.Results[0].Ontology_ID + ">" +res_json.Results[0].Ontology_ID+"</a></td></tr>" +"<tr><th>Definition</th><td>" +res_json.Results[0].Definition+"</td></tr>"+ "<tr><th>Alternative_Name</th><td>" +res_json.Results[0].AlternativeName+"</td></tr>"+ "<tr><th>Cross_Reference</th><td>" +res_json.Results[0].Cross_Reference+"</td></tr>";
                                html_str_ass += "<tr><td>" + (i + 1) + "</td>><td><a target='_blank' href='Association.jsp?id=" + res_json.Results[i].ncRPheDB_ID + "'>" + res_json.Results[i].ncRPheDB_ID + "</a></td><td>" + res_json.Results[i].ncRNA_Symbol + "</td><td>" + res_json.Results[i].Category + "</td><td>" + res_json.Results[i].Disease_Name + "(<a target='_blank'  href=https://www.ebi.ac.uk/ols/ontologies/efo/terms?iri=http%3A%2F%2Fwww.ebi.ac.uk%2Fefo%2F" + res_json.Results[i].Ontology_ID + ">" + res_json.Results[i].Ontology_ID + "</a>)</td><td>" + res_json.Results[i].Species + "</td><td>" + res_json.Results[i].Score + "</td></tr>";

                            }


                           }


                    }


                    $('#table_association').html(html_str_ass);

                    $("#dtBtn").css("visibility", "visible");
                    $("#toWordle").css("visibility", "visible");
                    $('#tabletoDL').dataTable();
                    $('#tabletoDL')


                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log("Failed");
            }
        });

    });
})