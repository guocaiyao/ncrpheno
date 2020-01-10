$(document).ready(function () {
    $('#Search').click(function(){
        $('#patient').html('')
        $('#NetworkResult').html('')
        $('#wrapper').html('')
        $("#Legend_figure").css("visibility", "hidden");
        $('#Legend_text').html('')
        $('#patient').html('The network is currently drawing...... Please be patient.')

        $('#lower_threshold').html('')
        var SelectType = $("#SelectType").val();

        var input = $("#txtVal").val();
        var Threshold = $("#Threshold").val();
        if(input==''){
            alert("Please input data in the box.")
        }
        console.log(SelectType);
        var url = ''
        if(SelectType=="Diseases"){
            url+= "ncrphedb/diseases";

        }else if(SelectType=="ncRNAs"){
            url+= "ncrphedb/ncRNAs";
        }else{
            alert("Before running the network analysis, please select the input data category. ")
        }


        //var symbol = "%" + $("#ncrna").val() + "%";//receive dynamic input
        var SelectSpecies= $("#SelectSpecies").val();
        // var input_s = input.slice(0,input.length-1)
        var input_lst = input.split(',')
        var input_lst1=input_lst.filter(m=>m); //filter ''
        var input_s = input_lst1.join(',')
        console.log(input_s);
        // var SelectSpecies = $("#SelectSpecies").val();
        console.log(url);
        var param = {
            input_s:input_s,
            selected:SelectSpecies
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
                    $('#NetworkResult').html('<span class="main">Network visualization results:</span>')
                    $('#lower_threshold').html('Sorry, no network was found for the threshold, please lower the threshold.')


                } else{
                    $('#patient').html('')

                    var disease_list = new Array()// disease list (node list)

                    var ncRNA_list = new Array()// ncrna  list(node list)


                    for(let i = 0; i < length; i++){
                        if(parseFloat(res_json.Results[i].Score) >= parseFloat(Threshold)){
                            let disease =  res_json.Results[i].Disease_Name

                            let ncRNA = res_json.Results[i].ncRNA_Symbol

                            // let ncRNA = res_json.Results[i].SNP
                            disease_list.push(disease)

                            ncRNA_list.push(ncRNA)


                        }
                    }


                    var disease_ncRNA_list = disease_list.concat(ncRNA_list)


                    if(disease_ncRNA_list.length>=1) { //判断设定阈值的association是否为空

                        $('#NetworkResult').html('<span class="main">Network visualization results:</span>')

                        $('#wrapper').html('<div  id="mynetwork"></div><div  id="loadingBar"><div   class="outerBorder"><div  id="text">0%</div><div  id="border"><div  id="bar"></div></div></div></div>');

                    //unique node(ncRNA_disease) list
                    const disease_ncRNA_items = new Set(disease_ncRNA_list)

                    const disease_ncRNA_list_uniq = Array.from(disease_ncRNA_items)
                    console.log(disease_ncRNA_list_uniq)

                    //unique disease list
                    const disease_items = new Set(disease_list)
                    const disease_list_uniq = Array.from(disease_items)
                    console.log(disease_list_uniq)

                    //unique  ncRNA list
                    const ncRNA_items = new Set(ncRNA_list)
                    const ncRNA_list_uniq = Array.from(ncRNA_items)
                    console.log(ncRNA_list_uniq)




                    var node_id = '{'
                    for(let i = 0; i < disease_list_uniq.length; i++){

                        let id = i+1
                        node_id+='"'+disease_list_uniq[i] +'":"'+id+'",'
                    }

                    for(let i = 0; i < ncRNA_list_uniq.length; i++){

                        let id = i+1 + disease_list_uniq.length

                       if(i<ncRNA_list_uniq.length-1){
                           node_id+='"'+ncRNA_list_uniq[i] +'":"'+id+'",'
                       }else{
                           node_id+='"'+ncRNA_list_uniq[i] +'":"'+id+'"}'
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


                    for (let i = 0; i < ncRNA_list_uniq.length; i++) {
                        let ncRNA = ncRNA_list_uniq[i]
                        let node_1 =  '{"id":"'+ node_id_obj[ncRNA]+ '", "label":"'+ ncRNA + '", "shape":"cirle", "color":"#FB7E81"}'
                        let node_1_obj = JSON.parse(node_1)
                        node_list.push(node_1_obj)
                    }

                    console.log(node_list)

                    // build edge_list
                    var edge_list=new Array()
                    for (let i = 0; i < length; i++) {
                        if(parseFloat(res_json.Results[i].Score) >= parseFloat(Threshold)){
                            let disease_name = res_json.Results[i].Disease_Name

                            let ncRNA = res_json.Results[i].ncRNA_Symbol
                            let score = res_json.Results[i].Score

                            // let edge_disease_snp = '{"from":"' +node_id_obj[disease_name]+ '", "to":"' + node_id_obj[SNP]+'", "label":"'+res_json.Results[i].Score + '","color":{"color":"#ff0000", "opacity":"'+ res_json.Results[i].Score+'"}}'
                            // let edge_disease_snp = '{"from":"' +node_id_obj[disease_name]+ '", "to":"' + node_id_obj[SNP]+ '","color":{"color":"#ff0000", "opacity":"'+ res_json.Results[i].Score+'"}'+ ',"value":"'+ res_json.Results[i].Score+'"}'


                            let edge_disease_ncRNA = '{"from":"' +node_id_obj[disease_name]+ '", "to":"' + node_id_obj[ncRNA]+'", "label":"'+res_json.Results[i].Score + '","color":{"color":"#ff0000"}'+ ',"value":"'+ score+'"}'


                            let dege_disease_ncRNA_obj =  JSON.parse(edge_disease_ncRNA)

                            edge_list.push(dege_disease_ncRNA_obj)



                            // let edge_parent_disease= '{"from":"' +node_id_obj[parent]+ '", "to":"' + node_id_obj[disease_name]+'", "label":"'+res_json.Results[i].Score + '","color":{"color":"#ff0000"}'+ ',"value":"'+ score+'"}'
                            //
                            // let dege_parentt_disease_obj =  JSON.parse(edge_parent_disease)
                            //
                            //
                            // edge_list.push(dege_parentt_disease_obj)
                        }
                        // console.log(edge)
                    }
                    console.log(edge_list)
                    //Unique for edge_list




                      function unique(arr) {
                          let unique = {};
                          arr.forEach(function (item) {
                              unique[JSON.stringify(item)] = item;//键名不会重复
                          })
                          arr = Object.keys(unique).map(function (u) {
                              //Object.keys()返回对象的所有键值组成的数组，map方法是一个遍历方法，返回遍历结果组成的数组.将unique对象的键名还原成对象数组
                              return JSON.parse(u);
                          })
                          return arr;
                      }

                      var edge_list_uniq = unique(edge_list)

                      // const edge_list_items = new Set(edge_list)
                      // const edge_list_uniq = Array.from(edge_list_items)
                      console.log(edge_list_uniq)

                      var nodes = new vis.DataSet(node_list);
                      // create an array with edges
                      var edges = new vis.DataSet(edge_list_uniq);


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
                      network.on("stabilizationProgress", function (params) {
                          var maxWidth = 496;
                          var minWidth = 20;
                          var widthFactor = params.iterations / params.total;
                          var width = Math.max(minWidth, maxWidth * widthFactor);

                          document.getElementById('bar').style.width = width + 'px';
                          document.getElementById('text').innerHTML = Math.round(widthFactor * 100) + '%';
                      });
                      network.once("stabilizationIterationsDone", function () {
                          document.getElementById('text').innerHTML = '100%';
                          document.getElementById('bar').style.width = '496px';
                          document.getElementById('loadingBar').style.opacity = 0;
// really clean the dom element
                          setTimeout(function () {
                              document.getElementById('loadingBar').style.display = 'none';
                          }, 500);
                      });

                      $("#Legend_figure").css("visibility", "visible");
                      $('#Legend_text').html('The red line with thicker indicates the ncRNA-disease association with higher association score, which ranges from 0 to 1.')

                  }else{

                      $('#NetworkResult').html('<span class="main">Network visualization results:</span>')
                      $('#lower_threshold').html('Sorry, no network was found for the threshold, please lower the threshold.')
                  }



                    // $("#loadingBar").css("visibility", "visible");
                }




            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log("Failed");
            }
        });

    });
})