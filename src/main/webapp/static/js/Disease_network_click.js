
$(document).ready(function () {
    (function () {

        $('#patient').html('')
        $('#NetworkResult').html('')
        $('#wrapper').html('')
        $("#Legend_figure").css("visibility", "hidden");
        $('#Legend_text').html('')
        $('#lower_threshold').html('')
        $('#patient').html('The network diagram is currently drawing... Please be patient.')

        $('#lower_threshold').html('')


        var tempurl = location.search.split(/[?&]/);
        var reg = new RegExp("%20","g");//g,表示全部替换�?
        var input_ncRNA = tempurl[1].replace(reg," ");
        var SelectSearch = tempurl[2].replace(reg, " ");
        console.log(input_ncRNA);
        console.log(SelectSearch);
        $('#patient').html('The network is currently drawing... Please be patient.')
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

                    $('#NetworkResult').html('<span class="main">'+"Disease-network"+ ' for '+  input_ncRNA +':</span>')
                    $('#lower_threshold').html('Sorry, there are no disease-network for '+input_ncRNA +' at the set threshold, please lower the threshold.')


                } else {
                    $('#patient').html('')
                    $('#NetworkResult').html('<span class="main">'+"Disease-network"+ ' of '+  res_json.Results[0].ncRNA_Symbol +':</span>')

                    $('#wrapper').html('<div  id="mynetwork"></div><div  id="loadingBar"><div   class="outerBorder"><div  id="text">0%</div><div  id="border"><div  id="bar"></div></div></div></div>');

                    var disease_list = new Array()// disease list (node list)


                    for(let i = 0; i < length; i++){
                            let disease =  res_json.Results[i].Disease_Name

                            let Parent = res_json.Results[i].Node

                            disease_list.push(disease)
                            disease_list.push(Parent)
                    }


                    //unique disease list
                    const disease_items = new Set(disease_list)
                    const disease_list_uniq = Array.from(disease_items)
                    console.log(disease_list_uniq)

                    var node_id = '{'
                    for(let i = 0; i < disease_list_uniq.length; i++){

                        let id = i+1

                        if(i<disease_list_uniq.length-1){
                            node_id+='"'+disease_list_uniq[i] +'":"'+id+'",'
                        }else{
                            node_id+='"'+disease_list_uniq[i] +'":"'+id+'"}'
                        }

                    }

                    // console.log(node_id)
                    var node_id_obj = $.parseJSON(node_id);



                    //build node_list
                    var node_list=new Array()//Including ncRNA Variants AND Disease

                    for (let i = 0; i < disease_list_uniq.length; i++) {
                        let disease = disease_list_uniq[i]
                        let node_1 =  '{"id":"'+node_id_obj[disease] + '", "label":"'+ disease + '", "shape":"box","color":"#17C2FC"}'
                        let node_1_obj = JSON.parse(node_1)
                        node_list.push(node_1_obj)
                    }

                    console.log(node_list)

                    // build edge_list
                    var edge_list=new Array()
                    for (let i = 0; i < length; i++) {
                            let disease_name = res_json.Results[i].Disease_Name
                            let parent = res_json.Results[i].Node
                            let score = res_json.Results[i].Score

                            let edge_parent_disease= '{"from":"' +node_id_obj[parent]+ '", "to":"' + node_id_obj[disease_name]+'", "label":"'+res_json.Results[i].Score + '","color":{"color":"#ff0000"}'+ ',"value":"'+ score+'"}'

                            let dege_parentt_disease_obj =  JSON.parse(edge_parent_disease)


                            edge_list.push(dege_parentt_disease_obj)

                    }
                    console.log(edge_list)

                    var nodes = new vis.DataSet(node_list);

                    // create an array with edges
                    var edges = new vis.DataSet(edge_list);





                    // create a network
                    var container = document.getElementById('mynetwork');


                    var data = {
                        nodes: nodes,
                        edges: edges
                    };
                    var options = {
                        nodes: {
                            shape: 'circle',
                            // physics:false
                        }

                    };

                    // var options = {physics:false};

                    var network = new vis.Network(container, data, options);
                    network.on("stabilizationProgress", function(params) {
                        var maxWidth = 496;
                        var minWidth = 20;
                        var widthFactor = params.iterations/params.total;
                        var width = Math.max(minWidth,maxWidth * widthFactor);

                        document.getElementById('bar').style.width = width + 'px';
                        document.getElementById('text').innerHTML = Math.round(widthFactor*100) + '%';
                    });
                    network.once("stabilizationIterationsDone", function() {
                        document.getElementById('text').innerHTML = '100%';
                        document.getElementById('bar').style.width = '496px';
                        document.getElementById('loadingBar').style.opacity = 0;
// really clean the dom element
                        setTimeout(function () {document.getElementById('loadingBar').style.display = 'none';}, 500);
                    });

                    $("#Legend_figure").css("visibility", "visible");
                    $('#Legend_text').html('The red line with thicker indicates the ncRNA-disease association with higher association score, which association score ranges from 0 to 1.')

                    // $("#loadingBar").css("visibility", "visible");

                }


                },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log("Failed");
            }
        });
    }())
})


