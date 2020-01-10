$(document).ready(function () {
    var temp = window.location.href;
    var association_id = temp.substr(temp.indexOf('=')+1);//获取url中的参数id
    $('#patient').html('The association data is currently processing...... Please be patient.')
        var url = "ncrphedb/association";
        console.log(url);
        var param = {
            ass_id:association_id

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
                $('#patient').html('')
                var table_title_ass = "<h3><span  style=\"color:#D27004\">(1). "+res_json.Results[0].ncRNA_Symbol+" - "+res_json.Results[0].Disease_Name +" association:"+"</span></h3>" //add table title for association
                $('#title_association').html(table_title_ass);



                var Ontology_ID = res_json.Results[0].Ontology_ID
                var sub_Ontology_ID = Ontology_ID.substr(0,2);
                console.log(sub_Ontology_ID)


                var html_str_ass = "<tr><th>Association_ID</th><th>ncRNA_Symbol</th><th>Disease_Name</th><th>Ontology_ID</th><th>Score</th></tr>";

                if(sub_Ontology_ID == 'HP'){
                    // var html_str_info = "<tr><th>Disease_Name</th><td>" +res_json.Results[0].Disease_Name+"</td></tr>" +  "<tr><th>Ontology_ID</th><td><a href= https://www.ebi.ac.uk/ols/ontologies/hp/terms?iri=http%3A%2F%2Fpurl.obolibrary.org%2Fobo%2F" +res_json.Results[0].Ontology_ID + ">" +res_json.Results[0].Ontology_ID+"</a></td></tr>" +"<tr><th>Definition</th><td>" +res_json.Results[0].Definition+"</td></tr>"+ "<tr><th>Alternative_Name</th><td>" +res_json.Results[0].AlternativeName+"</td></tr>"+ "<tr><th>Cross_Reference</th><td>" +res_json.Results[0].Cross_Reference+"</td></tr>";
                    html_str_ass+= "<tr><td><a href='/Association.jsp?id="+res_json.Results[0].ncRPheDB_ID+"'>"+ res_json.Results[0].ncRPheDB_ID+"</a></td><td>"+ res_json.Results[0].ncRNA_Symbol+"</td><td>"+res_json.Results[0].Disease_Name+"</td><td><a target='_blank' href=https://www.ebi.ac.uk/ols/ontologies/hp/terms?iri=http%3A%2F%2Fpurl.obolibrary.org%2Fobo%2F" +res_json.Results[0].Ontology_ID + ">" +res_json.Results[0].Ontology_ID+"</a></td><td>"+res_json.Results[0].Score+"</td></tr>";

                }else if(sub_Ontology_ID =='Or'){
                    // var html_str_info = "<tr><th>Disease_Name</th><td>" +res_json.Results[0].Disease_Name+"</td></tr>" +  "<tr><th>Ontology_ID</th><td><a href= http://www.orpha.net/ORDO/" +res_json.Results[0].Ontology_ID + ">" +res_json.Results[0].Ontology_ID+"</a></td></tr>" +"<tr><th>Definition</th><td>" +res_json.Results[0].Definition+"</td></tr>"+ "<tr><th>Alternative_Name</th><td>" +res_json.Results[0].AlternativeName+"</td></tr>"+ "<tr><th>Cross_Reference</th><td>" +res_json.Results[0].Cross_Reference+"</td></tr>";
                    html_str_ass+= "<tr><td><a href='/Association.jsp?id="+res_json.Results[0].ncRPheDB_ID+"'>"+ res_json.Results[0].ncRPheDB_ID+"</a></td><td>"+ res_json.Results[0].ncRNA_Symbol+"</td><td>"+res_json.Results[0].Disease_Name+"</td><td><a target='_blank' href=http://www.orpha.net/ORDO/" +res_json.Results[0].Ontology_ID + ">" +res_json.Results[0].Ontology_ID+"</a></td><td>"+res_json.Results[0].Score+"</td></tr>";

                }else{
                    if(sub_Ontology_ID =='MO'){
                        html_str_ass+= "<tr><td><a href='/Association.jsp?id="+res_json.Results[0].ncRPheDB_ID+"'>"+ res_json.Results[0].ncRPheDB_ID+"</a></td><td>"+ res_json.Results[0].ncRNA_Symbol+"</td><td>"+res_json.Results[0].Disease_Name+"</td><td><a target='_blank' href=https://www.ebi.ac.uk/ols/ontologies/mondo/terms?iri=http%3A%2F%2Fpurl.obolibrary.org%2Fobo%2F" +res_json.Results[0].Ontology_ID + ">" +res_json.Results[0].Ontology_ID+"</a></td><td>"+res_json.Results[0].Score+"</td></tr>";

                    }else if(sub_Ontology_ID =='GO'){
                        html_str_ass+= "<tr><td><a href='A/ssociation.jsp?id="+res_json.Results[0].ncRPheDB_ID+"'>"+ res_json.Results[0].ncRPheDB_ID+"</a></td><td>"+ res_json.Results[0].ncRNA_Symbol+"</td><td>"+res_json.Results[0].Disease_Name+"</td><td><a target='_blank' href=https://www.ebi.ac.uk/ols/ontologies/go/terms?iri=http%3A%2F%2Fpurl.obolibrary.org%2Fobo%2F" +res_json.Results[0].Ontology_ID + ">" +res_json.Results[0].Ontology_ID+"</a></td><td>"+res_json.Results[0].Score+"</td></tr>";

                    }else{
                        // var html_str_info = "<tr><th>Disease_Name</th><td>" +res_json.Results[0].Disease_Name+"</td></tr>" +  "<tr><th>Ontology_ID</th><td><a href= https://www.ebi.ac.uk/ols/ontologies/efo/terms?iri=http%3A%2F%2Fwww.ebi.ac.uk%2Fefo%2F" +res_json.Results[0].Ontology_ID + ">" +res_json.Results[0].Ontology_ID+"</a></td></tr>" +"<tr><th>Definition</th><td>" +res_json.Results[0].Definition+"</td></tr>"+ "<tr><th>Alternative_Name</th><td>" +res_json.Results[0].AlternativeName+"</td></tr>"+ "<tr><th>Cross_Reference</th><td>" +res_json.Results[0].Cross_Reference+"</td></tr>";
                        html_str_ass+= "<tr><td><a href='/Association.jsp?id="+res_json.Results[0].ncRPheDB_ID+"'>"+ res_json.Results[0].ncRPheDB_ID+"</a></td><td>"+ res_json.Results[0].ncRNA_Symbol+"</td><td>"+res_json.Results[0].Disease_Name+"</td><td><a target='_blank' href=https://www.ebi.ac.uk/ols/ontologies/efo/terms?iri=http%3A%2F%2Fwww.ebi.ac.uk%2Fefo%2F" +res_json.Results[0].Ontology_ID + ">" +res_json.Results[0].Ontology_ID+"</a></td><td>"+res_json.Results[0].Score+"</td></tr>";

                    }

                }




                $('#table_association').html(html_str_ass);



                var ncRNA_title_info = "<h3><span  style=\"color:#D27004\">(2). "+res_json.Results[0].ncRNA_Symbol+" information:"+"</span></h3>" //add table title for ncRNA-information
                $('#ncRNA_information').html(ncRNA_title_info);
                //var html_str_info = "<tr><th>ncRNA_Symbol</th><td>" +res_json.Results[0].ncRNA_Symbol+"</td></tr>" +  "<tr><th>ncRNA_ID</th><td>" +res_json.Results[0].ncRNA_ID+"</td></tr>" +"<tr><th>Alias</th><td>" +res_json.Results[0].Alias+"</td></tr>"+ "<tr><th>Category</th><td>" +res_json.Results[0].Category+"</td></tr>"+ "<tr><th>Species</th><td>" +res_json.Results[0].Species+"</td></tr>"+ "<tr><th>SNPs</th><td>";

                var ncRNA_id = res_json.Results[0].ncRNA_ID;
                console.log(ncRNA_id)
                var sub_ncRNA_id = ncRNA_id.substr(0,2);
                console.log(sub_ncRNA_id)

                if (sub_ncRNA_id == 'MI'){
                    var html_ncRNA_info = "<tr><th>ncRNA_Symbol</th><td>" +res_json.Results[0].ncRNA_Symbol+"</td></tr>" +  "<tr><th>miRBase</th><td>" +"<a target='_blank' href= http://www.mirbase.org/cgi-bin/mirna_entry.pl?acc="+res_json.Results[0].ncRNA_ID+">"+ res_json.Results[0].ncRNA_ID+"</a>"+"</td></tr>" +"<tr><th>Ensembl</th><td><a target='_blank' href=http://asia.ensembl.org/Multi/Search/Results?q="+ res_json.Results[0].Ensembl+">" +res_json.Results[0].Ensembl+"</a></td></tr>"+ "<tr><th>Category</th><td>" +res_json.Results[0].Category+"</td></tr>"+ "<tr><th>Species</th><td>" +res_json.Results[0].Species+"</td></tr>"+ "<tr><th>SNPs</th><td>";
                    "<tr><td></td><td>"
                } else{
                    var html_ncRNA_info = "<tr><th>ncRNA_Symbol</th><td>" +res_json.Results[0].ncRNA_Symbol+"</td></tr>" +  "<tr><th>RNAcentral</th><td>" +"<a target='_blank' href= https://rnacentral.org/search?q="+res_json.Results[0].ncRNA_ID+">"+ res_json.Results[0].ncRNA_ID+"</a>"+"</td></tr>" +"<tr><th>Ensembl</th><td><a target='_blank' href=http://asia.ensembl.org/Multi/Search/Results?q="+res_json.Results[0].Ensembl +">" +res_json.Results[0].Ensembl+"</a></td></tr>"+ "<tr><th>Category</th><td>" +res_json.Results[0].Category+"</td></tr>"+ "<tr><th>Species</th><td>" +res_json.Results[0].Species+"</td></tr>"+ "<tr><th>SNPs</th><td>";
                }
                var tempsnp = res_json.Results[0].SNPs.split(";");
                function insert_flg(str,flg,sn){
                    var newstr="";
                    var tmp1=str.substring(0, sn);
                    var tmp2=str.substring(sn);
                    newstr += tmp1+flg+tmp2;
                    return newstr;
                };

                if(tempsnp.length >0){
                        for (var i = 0;i < tempsnp.length-1;i++){
                            if (i>0){
                                html_ncRNA_info += ";";
                            };

                            html_ncRNA_info += "<a target='_blank' href='https://www.ncbi.nlm.nih.gov/projects/SNP/snp_ref.cgi?"+insert_flg(tempsnp[i],"=",2)+"'>"+ tempsnp[i] +"</a>";

                        }
                    }else{
                        html_ncRNA_info += 'N/A'
                    }


                html_ncRNA_info += "</td></tr>"+ "<tr><th>Targets</th><td>" +res_json.Results[0].Targets+"</td></tr>";

                // var html_str_info = "<tr><th>ncRNA_Symbol</th><th>ncRNA_ID</th><th>Alias</th><th>Category</th><th>Species</th><th>SNPs</th><th>Targets</th></tr>";
                // html_str_info+= "<tr><td>"+ res_json.Results[0].ncRNA_Symbol+"</td><td>"+ res_json.Results[0].ncRNA_ID+"</td><td>"+res_json.Results[0].Alias+"</td><td>"+res_json.Results[0].Category+"</td><td>"+res_json.Results[0].Species+"</td><td>"+res_json.Results[0].SNPs+"</td><td>"+res_json.Results[0].Targets+"</td></tr>";
                $('#ncRNA_table').html(html_ncRNA_info);



                var disease_title_info = "<h3><span  style=\"color:#D27004\">(3). "+res_json.Results[0].Disease_Name +" information:"+"</span></h3>"  //add table title for Disease-information


                $('#disease_information').html(disease_title_info);

                var Ontology_ID = res_json.Results[0].Ontology_ID
                var sub_Ontology_ID = Ontology_ID.substr(0,2);
                console.log(sub_Ontology_ID)

                if(sub_Ontology_ID == 'HP'){
                    var html_disease_info = "<tr><th>Disease_Name</th><td>" +res_json.Results[0].Disease_Name+"</td></tr>" +  "<tr><th>Ontology_ID</th><td><a target='_blank' href= https://www.ebi.ac.uk/ols/ontologies/hp/terms?iri=http%3A%2F%2Fpurl.obolibrary.org%2Fobo%2F" +res_json.Results[0].Ontology_ID + ">" +res_json.Results[0].Ontology_ID+"</a></td></tr>" +"<tr><th>Definition</th><td>" +res_json.Results[0].Definition+"</td></tr>"+ "<tr><th>Alternative_Name</th><td>" +res_json.Results[0].AlternativeName+"</td></tr>";

                }else if(sub_Ontology_ID =='Or'){
                    var html_disease_info = "<tr><th>Disease_Name</th><td>" +res_json.Results[0].Disease_Name+"</td></tr>" +  "<tr><th>Ontology_ID</th><td><a target='_blank' href= http://www.orpha.net/ORDO/" +res_json.Results[0].Ontology_ID + ">" +res_json.Results[0].Ontology_ID+"</a></td></tr>" +"<tr><th>Definition</th><td>" +res_json.Results[0].Definition+"</td></tr>"+ "<tr><th>Alternative_Name</th><td>" +res_json.Results[0].AlternativeName+ "</td></tr>";

                }else{
                    if(sub_Ontology_ID =='MO'){
                        var html_disease_info = "<tr><th>Disease_Name</th><td>" +res_json.Results[0].Disease_Name+"</td></tr>" +  "<tr><th>Ontology_ID</th><td><a target='_blank' href= https://www.ebi.ac.uk/ols/ontologies/mondo/terms?iri=http%3A%2F%2Fpurl.obolibrary.org%2Fobo%2F" +res_json.Results[0].Ontology_ID + ">" +res_json.Results[0].Ontology_ID+"</a></td></tr>" +"<tr><th>Definition</th><td>" +res_json.Results[0].Definition+"</td></tr>"+ "<tr><th>Alternative_Name</th><td>" +res_json.Results[0].AlternativeName+"</td></tr>";

                    }else if(sub_Ontology_ID =='GO'){
                        var html_disease_info = "<tr><th>Disease_Name</th><td>" +res_json.Results[0].Disease_Name+"</td></tr>" +  "<tr><th>Ontology_ID</th><td><a target='_blank' href= https://www.ebi.ac.uk/ols/ontologies/go/terms?iri=http%3A%2F%2Fpurl.obolibrary.org%2Fobo%2F" +res_json.Results[0].Ontology_ID + ">" +res_json.Results[0].Ontology_ID+"</a></td></tr>" +"<tr><th>Definition</th><td>" +res_json.Results[0].Definition+"</td></tr>"+ "<tr><th>Alternative_Name</th><td>" +res_json.Results[0].AlternativeName+"</td></tr>";

                    }else{
                        var html_disease_info = "<tr><th>Disease_Name</th><td>" +res_json.Results[0].Disease_Name+"</td></tr>" +  "<tr><th>Ontology_ID</th><td><a target='_blank' href= https://www.ebi.ac.uk/ols/ontologies/efo/terms?iri=http%3A%2F%2Fwww.ebi.ac.uk%2Fefo%2F" +res_json.Results[0].Ontology_ID + ">" +res_json.Results[0].Ontology_ID+"</a></td></tr>" +"<tr><th>Definition</th><td>" +res_json.Results[0].Definition+"</td></tr>"+ "<tr><th>Alternative_Name</th><td>" +res_json.Results[0].AlternativeName+"</td></tr>";

                    }

                }


                $('#disease_table').html(html_disease_info);




                var table_title_ass = "<h3><span  style=\"color:#D27004\">(4). In total of "+length +" publications evidence for "+res_json.Results[0].ncRNA_Symbol+" - "+res_json.Results[0].Disease_Name +" association:"+"</span></h3>"  //add table title for association
                $('#Evidence_title_association').html(table_title_ass);
                var Evidence_html_str_ass = "";



                for(var i=0;i<res_json.Results.length;i++) //the length of the json text
                {
                    Evidence_html_str_ass+="<tr class='danger'><th colspan='8'>Publication "+ (i+1) +": " +res_json.Results[i].Title +"</th></tr>"
                    if(sub_Ontology_ID == 'HP'){
                        Evidence_html_str_ass+= "<tr><th>PMID</th><td><a target='_blank' href=https://www.ncbi.nlm.nih.gov/pubmed/?term=" +res_json.Results[i].PMID + ">" +res_json.Results[i].PMID+"</a></td>><th>ncRNA_symbol</th><td>"
                            + res_json.Results[i].ncRNA_Symbol + "</td><th>Disease_name</th><td>" +res_json.Results[i].Disease_Name_1 +
                            "</td>><th>Ontology_id</th><td><a target='_blank' href=https://www.ebi.ac.uk/ols/ontologies/hp/terms?iri=http%3A%2F%2Fpurl.obolibrary.org%2Fobo%2F" +res_json.Results[i].Ontology_ID + ">" +res_json.Results[i].Ontology_ID+"</a></td>></tr><tr><th>Methods</th>><td>" +
                            res_json.Results[i].Methods +"</td>><th>Sample</th><td>" + res_json.Results[i].Sample_Name +
                            "</td>><th>Treatment</th><td>" + res_json.Results[i].Treatment+ "</td>><th>Species</th><td>" + res_json.Results[i].Species
                            + "</td>></tr><tr><th>Evidence & Conclusion Ontology</th><td colspan='7'>" + "<a target='_blank' href = 'https://www.ebi.ac.uk/ols/ontologies/eco'>"+ res_json.Results[i].ECO + "</a>"
                            + "</td>></tr><tr><th>Expression_pattern/Mutations</th><td colspan='7'>" + res_json.Results[i].Expression_pattern_or_Mutation
                            + "</td>></tr><tr><th>Description</th><td colspan='7'>" + res_json.Results[i].Description + "</td></tr><tr><th>Datasources</th><td colspan='7'>" + res_json.Results[i].Datasources + "</td></tr>";

                        // html_str_ass+= "<tr><td>"+(i+1)+"</td>><td><a href='Association.jsp?id="+res_json.Results[i].ncRPheDB_ID+"'>"+ res_json.Results[i].ncRPheDB_ID+"</a></td><td>"+ res_json.Results[i].ncRNA_Symbol+"</td><td>"+res_json.Results[i].Disease_Name+"</td><td><a href= https://www.ebi.ac.uk/ols/ontologies/hp/terms?iri=http%3A%2F%2Fpurl.obolibrary.org%2Fobo%2F" +res_json.Results[i].Ontology_ID + ">" +res_json.Results[i].Ontology_ID+"</a></td><td>"+res_json.Results[i].Score+"</td></tr>";

                    }else if(sub_Ontology_ID =='Or'){
                        Evidence_html_str_ass+= "<tr><th>PMID</th><td><a target='_blank' href=https://www.ncbi.nlm.nih.gov/pubmed/?term=" +res_json.Results[i].PMID + ">" +res_json.Results[i].PMID+"</a></td>><th>ncRNA_symbol</th><td>"
                            + res_json.Results[i].ncRNA_Symbol + "</td><th>Disease_name</th><td>" +res_json.Results[i].Disease_Name_1 +
                            "</td>><th>Ontology_id</th><td><a target='_blank' href=http://www.orpha.net/ORDO/" +res_json.Results[i].Ontology_ID + ">" +res_json.Results[i].Ontology_ID+"</a></td>></tr><tr><th>Methods</th>><td>" +
                            res_json.Results[i].Methods +"</td>><th>Sample</th><td>" + res_json.Results[i].Sample_Name +
                            "</td>><th>Treatment</th><td>" + res_json.Results[i].Treatment+ "</td>><th>Species</th><td>" + res_json.Results[i].Species
                            + "</td>></tr><tr><th>Evidence & Conclusion Ontology</th><td colspan='7'>" + "<a target='_blank' href = 'https://www.ebi.ac.uk/ols/ontologies/eco'>"+ res_json.Results[i].ECO + "</a>"
                            + "</td>></tr><tr><th>Expression_pattern/Mutations</th><td colspan='7'>" + res_json.Results[i].Expression_pattern_or_Mutation
                            + "</td>></tr><tr><th>Description</th><td colspan='7'>" + res_json.Results[i].Description + "</td></tr><tr><th>Datasources</th><td colspan='7'>" + res_json.Results[i].Datasources + "</td></tr>";

                        // html_str_ass+= "<tr><td>"+(i+1)+"</td>><td><a href='Association.jsp?id="+res_json.Results[i].ncRPheDB_ID+"'>"+ res_json.Results[i].ncRPheDB_ID+"</a></td><td>"+ res_json.Results[i].ncRNA_Symbol+"</td><td>"+res_json.Results[i].Disease_Name+"</td><td><a href=http://www.orpha.net/ORDO/" +res_json.Results[i].Ontology_ID + ">" +res_json.Results[i].Ontology_ID+"</a></td><td>"+res_json.Results[i].Score+"</td></tr>";

                    }else{
                        Evidence_html_str_ass+= "<tr><th>PMID</th><td><a target='_blank' href=https://www.ncbi.nlm.nih.gov/pubmed/?term=" +res_json.Results[i].PMID + ">" +res_json.Results[i].PMID+"</a></td>><th>ncRNA_symbol</th><td>"
                            + res_json.Results[i].ncRNA_Symbol + "</td><th>Disease_name</th><td>" +res_json.Results[i].Disease_Name_1 +
                            "</td>><th>Ontology_id</th><td><a target='_blank' href=https://www.ebi.ac.uk/ols/ontologies/efo/terms?iri=http%3A%2F%2Fwww.ebi.ac.uk%2Fefo%2F" +res_json.Results[i].Ontology_ID + ">" +res_json.Results[i].Ontology_ID+"</a></td>></tr><tr><th>Methods</th>><td>" +
                            res_json.Results[i].Methods +"</td>><th>Sample</th><td>" + res_json.Results[i].Sample_Name +
                            "</td>><th>Treatment</th><td>" + res_json.Results[i].Treatment+ "</td>><th>Species</th><td>" + res_json.Results[i].Species
                            + "</td>></tr><tr><th>Evidence & Conclusion Ontology</th><td colspan='7'>" + "<a target='_blank' href = 'https://www.ebi.ac.uk/ols/ontologies/eco'>"+ res_json.Results[i].ECO + "</a>"
                            + "</td>></tr><tr><th>Expression_pattern/Mutations</th><td colspan='7'>" + res_json.Results[i].Expression_pattern_or_Mutation
                            + "</td>></tr><tr><th>Description</th><td colspan='7'>" + res_json.Results[i].Description + "</td></tr><tr><th>Datasources</th><td colspan='7'>" + res_json.Results[i].Datasources + "</td></tr>";

                        // html_str_ass+= "<tr><td>"+(i+1)+"</td>><td><a href='Association.jsp?id="+res_json.Results[i].ncRPheDB_ID+"'>"+ res_json.Results[i].ncRPheDB_ID+"</a></td><td>"+ res_json.Results[i].ncRNA_Symbol+"</td><td>"+res_json.Results[i].Disease_Name+"</td><td><a href=https://www.ebi.ac.uk/ols/ontologies/efo/terms?iri=http%3A%2F%2Fwww.ebi.ac.uk%2Fefo%2F" +res_json.Results[i].Ontology_ID + ">" +res_json.Results[i].Ontology_ID+"</a></td><td>"+res_json.Results[i].Score+"</td></tr>";
                    }


                }
                $('#Evidence_table_association').html(Evidence_html_str_ass);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log("Failed");
            }
        });

})