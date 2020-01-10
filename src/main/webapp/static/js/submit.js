
$(document).ready(function () {
    $('#submit').click(function(){
        var url = "ncrphedb/submit";
        var ncRNA = $("#ncRNA").val();
        var disease = $("#disease").val();
        var sample = $("#sample").val();
        var methods = $("#methods").val();
        var PMID = $("#PMID").val();
        var expression = $("#expression").val();
        var target = $("#target").val();
        var SNP = $("#SNP").val();
        var treatment = $("#treatment").val();
        var description = $("#description").val();
        console.log(url);
        if(ncRNA==''||disease == ''||methods==''||PMID==''){
            alert("The symbol * indicates required fields");
        }
        else{
            var param = {
            ncRNA:ncRNA,
            disease:disease,
            sample:sample,
            methods:methods,
            PMID:PMID,
            expression:expression,
            target:target,
            SNP:SNP,
            treatment:treatment,
            description:description
                };
            $.ajax({
                type:"post",
                url:url,
                dataType:"text",
                data:param,
                cache:false,
                success:function () {
                    alert("Your submission is successful, thanks for your submission");
                    console.log("success_wl");
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    console.log("Failed");
                }
            });
        };
    });
})
