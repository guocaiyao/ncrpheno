$(document).ready(function () {
    $('#Search').click(function(){
        $('#patient').html('')
        $('#AnalysisResult').html('')
        $("#dtBtn").css("visibility", "hidden");
        $('#patient').html('The job is currently running...... Please be patient.')

        if ($('#tabletoDL').hasClass('dataTable')) {
            var oldTable = $('#tabletoDL').dataTable();
            oldTable.fnClearTable(); //清空一下table
            oldTable.fnDestroy(); //还原初始化了的dataTable
            // $('#tabletoDL').empty();
        }
        $('#table_head').html('')

        // var SelectType = $("#SelectType").val();

        var input_ncRNAs = $("#txtVal").val();
        var input_disease = $("#input_disease").val();
        console.log(input_disease);
        var url = ''
        if(input_ncRNAs=='' || input_disease==''){
            $('#patient').html('')
            alert("Please input the ncRNA and disease symbols in the text boxes.")
        }else{

                url+= "ncrphedb/transcriptlyzer";

        }

        //var symbol = "%" + $("#ncrna").val() + "%";//receive dynamic input

        // var input_s = input.slice(0,input.length-1)
        var input_ncRNA_lst = input_ncRNAs.split('\n')

        console.log(input_ncRNA_lst)

        var input_ncRNA_lst1=input_ncRNA_lst.filter(m=>m); //filter ''
        console.log(input_ncRNA_lst1)

        const input_ncRNA_items = new Set(input_ncRNA_lst1)
        const input_ncRNA_lst_uniq = Array.from(input_ncRNA_items)


        var input_ncRNAs_final = input_ncRNA_lst_uniq.join(',')
        console.log(input_ncRNAs_final);
        // var SelectSpecies = $("#SelectSpecies").val();
        console.log(url);
        console.log(input_disease);
        var param = {
            input_Rs:input_ncRNAs_final,
            input_D:input_disease
            // selectedR:SelectType
            // selectedS:SelectSpecies
        };

        $.ajax({
            type:"post",
            url:url,
            dataType:"text",
            data:param,
            cache:false,
            success:function (res) {
                console.log(res);


                ///判断字符串是不是json 字符串
                function isJSON(str) {
                    if (typeof str == "string") {
                        try {
                            JSON.parse(str);
                            return str;
                        } catch(e) {
                            var res_obj = str.replace(',]}',']}')
                            console.log(e);
                            return res_obj;
                        }
                    }

                }

                var res_obj = isJSON(res)
                console.log(res_obj);


                var res_json = $.parseJSON(res_obj);
                var length = res_json.Results.length;
                console.log("length:"+length);

                //JSON transform to Table for html visualization of web Front
                if (length == 0){


                    $('#patient').html('')
                    $('#AnalysisResult').html('<span class="main">ncRNA prioritization results:</span>')

                    var  html_str_table_head= "<tr><th>ncRNA_Symbol</th><th>Category</th><th>Disease phenotype (Ontology ID)</th><th>Species</th><th>Association score</th><th>Detail</th></tr>";
                    $('#table_head').html(html_str_table_head);

                    $("#dtBtn").css("visibility", "visible");
                    // $('#sorry').html("Sorry, there are not found ncRNA dysregulatin associated with " + input_disease +"!!")
                    $('#tabletoDL').dataTable();
                    $('#tabletoDL')

                    // alert("Sorry, there are not found ncRNA dysregulatin associated with " + input_disease +"!!")



                } else{
                    $('#patient').html('')
                    $('#AnalysisResult').html('<span class="main">ncRNA prioritization results:</span>')



                    var table_title_ass = "<h3><span style=\"color:#D27004\">The prioritized disease phenotype profile of "+ res_json.Results[0].ncRNA_Symbol +", in total of "+length+" assoications:</span></h3>"//add table title for association

                    //
                    $('#title_association').html(table_title_ass);

                    var Ontology_ID = res_json.Results[0].Ontology_ID
                    var sub_Ontology_ID = Ontology_ID.substr(0,2);
                    console.log(sub_Ontology_ID)




                    var  html_str_table_head= "<tr><th>ncRNA_Symbol</th><th>Category</th><th>Disease phenotype (Ontology ID)</th><th>Species</th><th>Association score</th><th>Detail</th></tr>";
                    $('#table_head').html(html_str_table_head);

                    var html_str_ass =''

                    for(var i=0;i<res_json.Results.length;i++) //the length of the json text
                    {


                        if(JSON.stringify(res_json.Results[i]) != '{}'){ //除去末尾数据为空的mysql对象
                            if(sub_Ontology_ID == 'HP'){
                                // var html_str_info = "<tr><th>Disease_Name</th><td>" +res_json.Results[0].Disease_Name+"</td></tr>" +  "<tr><th>Ontology_ID</th><td><a href=https://www.ebi.ac.uk/ols/ontologies/efo/terms?iri=http%3A%2F%2Fwww.ebi.ac.uk%2Fefo%2F" +res_json.Results[0].Ontology_ID + ">" +res_json.Results[0].Ontology_ID+"</a></td></tr>" +"<tr><th>Definition</th><td>" +res_json.Results[0].Definition+"</td></tr>"+ "<tr><th>Alternative_Name</th><td>" +res_json.Results[0].AlternativeName+"</td></tr>"+ "<tr><th>Cross_Reference</th><td>" +res_json.Results[0].Cross_Reference+"</td></tr>";
                                html_str_ass+= "<tr><td>"+ res_json.Results[i].ncRNA_Symbol+"</td><td>"+ res_json.Results[i].Category+"</td><td>"+res_json.Results[i].Disease_Name+"(<a target='_blank' href= https://www.ebi.ac.uk/ols/ontologies/hp/terms?iri=http%3A%2F%2Fpurl.obolibrary.org%2Fobo%2F" +res_json.Results[i].Ontology_ID + ">" +res_json.Results[i].Ontology_ID+"</a>)</td><td>"+ res_json.Results[i].Species + "</td><td>"+res_json.Results[i].Score+"</td><td>"+"<a target='_blank' href='Association.jsp?id="+res_json.Results[i].ncRPheDB_ID+"'>"+ "Detail</a></td></tr>";

                            }else if(sub_Ontology_ID =='Or'){
                                // var html_str_info = "<tr><th>Disease_Name</th><td>" +res_json.Results[0].Disease_Name+"</td></tr>" +  "<tr><th>Ontology_ID</th><td><a href= http://www.orpha.net/ORDO/" +res_json.Results[0].Ontology_ID + ">" +res_json.Results[0].Ontology_ID+"</a></td></tr>" +"<tr><th>Definition</th><td>" +res_json.Results[0].Definition+"</td></tr>"+ "<tr><th>Alternative_Name</th><td>" +res_json.Results[0].AlternativeName+"</td></tr>"+ "<tr><th>Cross_Reference</th><td>" +res_json.Results[0].Cross_Reference+"</td></tr>";
                                html_str_ass+= "<tr><td>"+ res_json.Results[i].ncRNA_Symbol+"</td><td>"+ res_json.Results[i].Category+"</td><td>"+res_json.Results[i].Disease_Name+"(<a target='_blank' href=http://www.orpha.net/ORDO/" +res_json.Results[i].Ontology_ID + ">" +res_json.Results[i].Ontology_ID+"</a>)</td><td>"+ res_json.Results[i].Species + "</td><td>"+res_json.Results[i].Score+"</td><td>"+"<a target='_blank' href='Association.jsp?id="+res_json.Results[i].ncRPheDB_ID+"'>"+"Detail</a></td></tr>";

                            }else{
                                if(sub_Ontology_ID =='MO'){
                                    html_str_ass+= "<tr><td>"+ res_json.Results[i].ncRNA_Symbol+"</td><td>"+ res_json.Results[i].Category+"</td><td>"+res_json.Results[i].Disease_Name+"(<a target='_blank' href=https://www.ebi.ac.uk/ols/ontologies/mondo/terms?iri=http%3A%2F%2Fpurl.obolibrary.org%2Fobo%2F" +res_json.Results[i].Ontology_ID + ">" +res_json.Results[i].Ontology_ID+"</a>)</td><td>"+ res_json.Results[i].Species + "</td><td>"+res_json.Results[i].Score+"</td><td>"+"<a target='_blank' href='Association.jsp?id="+res_json.Results[i].ncRPheDB_ID+"'>"+ "Detail</a></td></tr>";

                                }else if(sub_Ontology_ID =='GO'){
                                    html_str_ass+= "<tr><td>"+ res_json.Results[i].ncRNA_Symbol+"</td><td>"+ res_json.Results[i].Category+"</td><td>"+res_json.Results[i].Disease_Name+"(<a target='_blank' href=https://www.ebi.ac.uk/ols/ontologies/go/terms?iri=http%3A%2F%2Fpurl.obolibrary.org%2Fobo%2F" +res_json.Results[i].Ontology_ID + ">" +res_json.Results[i].Ontology_ID+"</a>)</td><td>"+ res_json.Results[i].Species + "</td><td>"+res_json.Results[i].Score+"</td><td>"+"<a target='_blank' href='Association.jsp?id="+res_json.Results[i].ncRPheDB_ID+"'>"+ "Detail</a></td></tr>";

                                }else{
                                    // var html_str_info = "<tr><th>Disease_Name</th><td>" +res_json.Results[0].Disease_Name+"</td></tr>" +  "<tr><th>Ontology_ID</th><td><a href= http://purl.obolibrary.org/obo/" +res_json.Results[0].Ontology_ID + ">" +res_json.Results[0].Ontology_ID+"</a></td></tr>" +"<tr><th>Definition</th><td>" +res_json.Results[0].Definition+"</td></tr>"+ "<tr><th>Alternative_Name</th><td>" +res_json.Results[0].AlternativeName+"</td></tr>"+ "<tr><th>Cross_Reference</th><td>" +res_json.Results[0].Cross_Reference+"</td></tr>";
                                    html_str_ass+= "<tr><td>"+ res_json.Results[i].ncRNA_Symbol+"</td><td>"+ res_json.Results[i].Category+"</td><td>"+res_json.Results[i].Disease_Name+"(<a target='_blank' href=https://www.ebi.ac.uk/ols/ontologies/efo/terms?iri=http%3A%2F%2Fwww.ebi.ac.uk%2Fefo%2F" +res_json.Results[i].Ontology_ID + ">" +res_json.Results[i].Ontology_ID+"</a>)</td><td>"+ res_json.Results[i].Species + "</td><td>"+res_json.Results[i].Score+"</td><td>"+"<a target='_blank' href='Association.jsp?id="+res_json.Results[i].ncRPheDB_ID+"'>"+ "Detail</a></td></tr>";

                                }

                                 }
                        }

                    }


                    $('#table_association').html(html_str_ass);

                    $("#dtBtn").css("visibility", "visible");
                    $("#toTreeview").css("visibility", "visible");

                    $('#tabletoDL').dataTable({
                        "order": [[ 4, 'desc' ]]
                    });
                    $('#tabletoDL')


                }

            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log("Failed");
            }
        });

    });
})