$(document).ready(function () {
    $('#clear').click(function(){
        $("#ncRNA").val("");
        $("#disease").val("");
        $("#sample").val("");
        $("#methods").val("");
        $("#PMID").val("");
        $("#expression").val("");
        $("#target").val("");
        $("#SNP").val("");
        $("#treatment").val("");
        $("#description").val("");
        $("#txtVal").val("");
        $("#newAdd").val("");
        $("#Threshold").val("---Please set threshold---");
        $("#SelectSpecies").val("---Please select species---");

        $("#SelectType").val("---Please select data category---");
        $("#input_disease").val("");
        $("#input_ncRNA").val("");

        console.log(url);

    });
})