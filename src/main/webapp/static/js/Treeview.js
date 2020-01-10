
$(document).ready(function () {
    (function () {

        var tempurl = location.search.split(/[?&]/);
        var reg = new RegExp("%20","g");//g,表示全部替换�?
        var input_ncRNA = tempurl[1].replace(reg," ");
        var SelectSearch = tempurl[2].replace(reg, " ");
        $('#patient').html('The disease tree is currently drawing... Please be patient.')
        var url = "ncrphedb/ncRNA_1";
        console.log(url);
        var param = {
            input_R:input_ncRNA,
            selected:SelectSearch
        };

        $.ajax({
            type:"post",
            url:url,
            dataType:"text",
            data:param,
            cache:false,
            success:function (res) {
                $("TreeView").empty();//remove results of previous search
                // alert("success")
                console.log(res)
                var res_json = $.parseJSON(res);
                var length = res_json.Results.length;
                if (length == 0){
                    $('#patient').html('')
                    // var table_title_info = "<h4>ncRNA-information:</h4>" //add table title for ncRNA-information
                    // $('#title_information').html(table_title_info);
                    // var html_str_info = "<tr><th>ncRNA_Symbol</th><th>ncRNA_ID</th><th>Alias</th><th>Category</th><th>Species</th><th>SNPs</th><th>Targets</th></tr>";
                    // var html_str_info = "<tr><th>ncRNA_Symbol</th></tr><tr><th>ncRNA_ID</th></tr><tr><th>Alias</th></tr><tr><th>Category</th></tr><tr><th>Species</th></tr><tr><th>SNPs</th></tr><tr><th>Targets</th></tr>";
                    // $('#table_information').html(html_str_info);
                    //
                    // var table_title_ass = "<h4>ncRNA-disease tree visualization:</h4>" //add table title for association
                    // $('#title_association').html(table_title_ass);
                    alert("Sorry, there are no association for your input ncRNA!!")
                }else {
                    $('#patient').html('')
                    var table_title_info = "<h3><span  style=\"color:#D27004\">"+res_json.Results[0].ncRNA_Symbol+" information:"+"</span></h3>" //add table title for ncRNA-information
                    $('#title_information').html(table_title_info);
                    //var html_str_info = "<tr><th>ncRNA_Symbol</th><td>" +res_json.Results[0].ncRNA_Symbol+"</td></tr>" +  "<tr><th>ncRNA_ID</th><td>" +res_json.Results[0].ncRNA_ID+"</td></tr>" +"<tr><th>Alias</th><td>" +res_json.Results[0].Alias+"</td></tr>"+ "<tr><th>Category</th><td>" +res_json.Results[0].Category+"</td></tr>"+ "<tr><th>Species</th><td>" +res_json.Results[0].Species+"</td></tr>"+ "<tr><th>SNPs</th><td>";

                    var ncRNA_id = res_json.Results[0].ncRNA_ID
                    var sub_ncRNA_id = ncRNA_id.substr(0,2);
                    console.log(sub_ncRNA_id)

                    if (sub_ncRNA_id == 'MI'){
                        var html_str_info = "<tr><th>ncRNA_Symbol</th><td>" +res_json.Results[0].ncRNA_Symbol+"</td></tr>" +  "<tr><th>miRBase</th><td>" +"<a target='_blank' href= http://www.mirbase.org/cgi-bin/mirna_entry.pl?acc="+res_json.Results[0].ncRNA_ID+">"+ res_json.Results[0].ncRNA_ID+"</a>"+ "<tr><th>Ensembl</th><td>" +"<a target='_blank'  href= http://asia.ensembl.org/Homo_sapiens/Transcript/Summary?db=core;t="+res_json.Results[0].Ensembl+">"+ res_json.Results[0].Ensembl+"</a>"+"<tr><th>Category</th><td>" +res_json.Results[0].Category+"</td></tr>"+ "<tr><th>Species</th><td>" +res_json.Results[0].Species+"</td></tr>"+ "<tr><th>SNPs</th><td>";
                        "<tr><td></td><td>"
                    } else{
                        var html_str_info = "<tr><th>ncRNA_Symbol</th><td>" +res_json.Results[0].ncRNA_Symbol+"</td></tr>" +  "<tr><th>RNAcentral</th><td>" +"<a target='_blank' href= https://rnacentral.org/search?q="+res_json.Results[0].ncRNA_ID+">"+ res_json.Results[0].ncRNA_ID+"</a>"+"<tr><th>Ensembl</th><td>" +"<a target='_blank' href= http://asia.ensembl.org/Homo_sapiens/Transcript/Summary?db=core;t="+res_json.Results[0].Ensembl+">"+ res_json.Results[0].Ensembl+"</a>"+"</td></tr>" + "<tr><th>Category</th><td>" +res_json.Results[0].Category+"</td></tr>"+ "<tr><th>Species</th><td>" +res_json.Results[0].Species+"</td></tr>"+ "<tr><th>SNPs</th><td>";
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
                                html_str_info += ";";
                            };

                            html_str_info += "<a target='_blank' href='https://www.ncbi.nlm.nih.gov/projects/SNP/snp_ref.cgi?"+insert_flg(tempsnp[i],"=",2)+"'>"+ tempsnp[i] +"</a>";

                        }
                    }else{
                        html_str_info += 'N/A'
                    }


                    html_str_info += "</td></tr>"+ "<tr><th>Targets</th><td>" +res_json.Results[0].Targets+"</td></tr>";



                    // var html_str_info = "<tr><th>ncRNA_Symbol</th><th>ncRNA_ID</th><th>Alias</th><th>Category</th><th>Species</th><th>SNPs</th><th>Targets</th></tr>";
                    // html_str_info+= "<tr><td>"+ res_json.Results[0].ncRNA_Symbol+"</td><td>"+ res_json.Results[0].ncRNA_ID+"</td><td>"+res_json.Results[0].Alias+"</td><td>"+res_json.Results[0].Category+"</td><td>"+res_json.Results[0].Species+"</td><td>"+res_json.Results[0].SNPs+"</td><td>"+res_json.Results[0].Targets+"</td></tr>";
                    $('#table_information').html(html_str_info);

                    var table_title_ass = "<h3><span style=\"color:#D27004\">The tree profile of "+ res_json.Results[0].ncRNA_Symbol +" dysregulation associated with grouped diseases, in total of "+length+" associations:</span></h3>" //add table title for association
                    $('#title_association').html(table_title_ass);
                    //Receive the disease_tree data objection
                    var note = "<span style=\"color:#D21004\">(Note: Each blue annular node in the disease-tree profile links to further webpages for more evidential and biomedical information from publications.)</span>";
                    $('#note').html(note);

                    let data = res_json.Results
                    console.log(data); //set attributes
                    let attributes = {
                        ParentDisease: 'Node',
                        name: 'Disease_Name',
                        score:'Score',
                        rootDisease: 'Disease',
                        url:'ncRPheDB_ID'
                    };
                    let option = {
                        tooltip : {

                        },
                        serise : [
                            {
                                name: 'treemap',
                                type: 'tree',
                            }
                        ]
                    };
                    function toTreeData (data, attributes) {
                        let resData = data;
                        let tree = [];

                        for (let i = 0; i < resData.length; i++) {
                            if (resData[i][attributes.ParentDisease] === attributes.rootDisease) {
                                let obj = {
                                    name: resData[i][attributes.name],
                                    score: resData[i][attributes.score],
                                    url: resData[i][attributes.url],
                                    children: []
                                };
                                tree.push(obj);
                                resData.splice(i,1);
                                i--;
                            }
                        }
                        run(tree);
                        function run(chiArr) {
                            if (resData.length !== 0) {
                                for (let i = 0; i < chiArr.length; i++) {
                                    for (let j = 0; j < resData.length; j++) {
                                        if (chiArr[i].name === resData[j][attributes.ParentDisease]) {
                                            let obj = {
                                                name: resData[j][attributes.name],
                                                score: resData[j][attributes.score],
                                                url: resData[j][attributes.url],
                                                children: []
                                            };
                                            chiArr[i].children.push(obj);
                                            resData.splice(j, 1);
                                            j--;
                                        }
                                    }
                                    run(chiArr[i].children);
                                }
                            }
                        }
                        return tree;
                    }
                    let treeData = toTreeData(data, attributes);
                    console.log(treeData);
                    //add the Root_Disease
                    var res_json = $.parseJSON(res);
                    var length = res_json.Results.length;//receive the number of associations
                    var childrens = '';
                    for (var i=0; i< treeData.length;i++){
                        if(i<treeData.length-1){
                            childrens = childrens +  JSON.stringify(treeData[i]) +",";
                        }else{
                            childrens = childrens +  JSON.stringify(treeData[i]);
                        }
                    }
                    var TreeData = '{name:"disease",score:"All",children:[' + childrens + ']}';
                    // var TreeData = '{name:"disease",score:"All",children:[' + JSON.stringify(treeData[0]) + ']}';

                    console.log(TreeData);
                    //json string transfer to json object
                    ResTreeData = eval('(' + TreeData + ')');
                    console.log(ResTreeData);
                    console.log(length);
                    //if else 判断length，给予相应的图片空间
                    //if else 判断length，给予相应的图片空间
                    if (length <30){
                        var width = 1100,
                            height = 1100;

                        var tree = d3.layout.tree()
                            .size([width-200, height-200])
                            .separation(function(a, b) { return (a.parent == b.parent ? 1 : 2); });

                    } else if (30<=length && length<=40){
                        var width = 1400,
                            height = 1400;

                        var tree = d3.layout.tree()
                            .size([width-200, height-200])
                            .separation(function(a, b) { return (a.parent == b.parent ? 1 : 2); });
                    } else if (40<length && length <=100){
                        var width = 1800,
                            height = 1800;

                        var tree = d3.layout.tree()
                            .size([width-200, height-200])
                            .separation(function(a, b) { return (a.parent == b.parent ? 1 : 2); });
                    } else if(100<length && length <=200){
                        var width = 15*length,
                            height = 15*length;

                        var tree = d3.layout.tree()
                            .size([width,height])
                            .separation(function(a, b) { return (a.parent == b.parent ? 1 : 2); });
                    }else{
                        var width = 3000,
                            height = 3000;

                        var tree = d3.layout.tree()
                            .size([width,height])
                            .separation(function(a, b) { return (a.parent == b.parent ? 1 : 2); });
                    }


                    var diagonal = d3.svg.diagonal()
                        .projection(function(d) { return [d.y, d.x]; });

                    var svg = d3.select("body").selectAll("TreeView").append("svg")
                        .attr("id", "treeMap")
                        .attr("width", 1.2*width)
                        .attr("height", 1.2*height)
                        .append("g")
                        .attr("transform", "translate(40,0)");
                    // use the received disease tree data to complete the tree visualization by D3.js technology
                    var root = ResTreeData;

                    var nodes = tree.nodes(root);
                    var links = tree.links(nodes);

                    console.log(nodes);
                    console.log(links);

                    var link = svg.selectAll(".link")
                        .data(links)
                        .enter()
                        .append("path")
                        .attr("class", "link")
                        .attr("d", diagonal);

                    var node = svg.selectAll(".node")
                        .data(nodes)
                        .enter()
                        .append("g")
                        .attr("class", "node")
                        .attr("transform", function(d) { return "translate(" + d.y + "," + d.x + ")"; })

                    node.append("a")
                        .attr("xlink:href", function(d) {
                            return "http://lilab2.sysu.edu.cn/ncrpheno/Association.jsp?id="+d.url;
                        })
                        .attr("target", "_blank")
                        .append("circle")
                        .attr("r", 9);

                    node.append("text")
                        .attr("dx", function(d) { return d.children ? -8 : 8; })
                        .attr("dy", -2)
                        .attr('font-size',10)
                        .style("text-anchor",function(d) { return d.children ? "end" : "start"; })
                        .text(function(d) { return  d.score; });
                    node.append("text")
                        .attr("dx", function(d) { return d.children ? -8 : 8; })
                        .attr("dy", -2)
                        .attr('font-size',10)
                        .style("text-anchor","overflow:hidden", function(d) { return d.children ? "end" : "start"; })
                        .text(function(d) { return ("________"+d.name); });

                    $("#imgSave").css("visibility", "visible");

                }


            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log("Failed");
            }
        });
    }())
})


