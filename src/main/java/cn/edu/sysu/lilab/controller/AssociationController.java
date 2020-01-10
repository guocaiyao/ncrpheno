package cn.edu.sysu.lilab.controller;

import cn.edu.sysu.lilab.common.vo.Record;
import cn.edu.sysu.lilab.common.vo.RestJson;
import cn.edu.sysu.lilab.domain.*;
import cn.edu.sysu.lilab.service.AssociationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;
import sun.security.util.Length;

import javax.annotation.Resource;
import javax.xml.crypto.Data;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Author: gyao
 * Date: 1/7/20
 * E-mail: yaoguocai_cool@163.com
 **/
@Controller
@RequestMapping("ncrphedb")
public class AssociationController {
    @Resource
    @Autowired
    private AssociationService associationService;

    @ResponseBody
    @RequestMapping("/association")
    public Record queryByAssociationName(
            @RequestParam(name = "ass_id",required = true,defaultValue = "ncRP00000001")
                    String ass_id
    ){
        List<AssociationBasedInfo> associationList=associationService.queryByAssociationName(ass_id);
        Record record=new Record();
        record.put("Results",associationList);
        return record;
    }

    @ResponseBody
    @RequestMapping("/disease")
    public Record disease(
            @RequestParam (name = "input_D",required = true,defaultValue = "cancer") String input_D,
            @RequestParam(name = "selectedR") String selectedR)
            throws Exception{
        Date date1=new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
        String date1Str=simpleDateFormat.format(date1);
        System.out.println("search before: "+date1Str);
        System.out.println("param1: "+input_D+",param2: "+selectedR);
        List<DiseaseBasedInfo> associationList;
        if (selectedR.equals("All ncRNA types")){
            associationList=associationService.queryByDisease(input_D);
        }else {
            associationList=associationService.queryByDiseaseAndType(input_D,selectedR);
        }
        Record record=new Record();
        Date date2=new Date();
        String date2Str=simpleDateFormat.format(date2);
        System.out.println("search after: "+date2Str);
        record.put("Results",associationList);
        return record;
    }
    @ResponseBody
    @RequestMapping("/ncRNA_1")
    public Record queryByncRNA(
            @RequestParam (name = "input_R",required = true,defaultValue = "116HG")
                    String input_R,
            @RequestParam(name = "selected",required = true,defaultValue = "Homo sapiens")
                    String selected){
        List<ncRNABasedInfo> associationList=associationService.queryByncRNA(input_R,selected);
        Record record=new Record();
        record.put("Results",associationList);
        return record;
    }
    @ResponseBody
    @RequestMapping("/disease/browse")
    public Record diseaseBrowse(
            @RequestParam(name="disease",required = true,defaultValue = "Skin cancer")
            String disease){
        List<Node> associationList=associationService.diseaseBrowse(disease);
        Record record=new Record();
        record.put("Results",associationList);
        return record;
    }
    @ResponseBody
    @RequestMapping("/diseases")
    public Record queryDiseaseandSpecies(
            @RequestParam (name = "input_S",required = true,defaultValue = "Skin cancer")
                    String input_S,
            @RequestParam(name = "selected",required = true,defaultValue = "Homo sapiens")
            String selected){
        List<Node> associationList=associationService.queryDiseaseandSpecies(input_S,selected);
        Record record=new Record();
        record.put("Results",associationList);
        return record;
    }

    @ResponseBody
    @RequestMapping("/ncRNAs")
    public Record queryByncRNAs(
            @RequestParam(name = "input_S",required = true) String input_S,
            @RequestParam(name = "selected",required = true) String selected){
        ArrayList<Node> associationList=associationService.queryByOnencRNA(input_S,selected);
        Record record = new Record();
        record.put("Results",associationList);
        return record;
    }

    @ResponseBody
    @RequestMapping("/transcriptlyzer")
    public Record queryByncRNAandDisease(
            @RequestParam(name = "input_Rs",required = true) String input_Rs,
            @RequestParam(name = "input_D",required = true) String input_D){
        ArrayList<Node> associationList=associationService.queryByncRNAandDisease(input_Rs,input_D);
        Record record = new Record();
        record.put("Results",associationList);
        return record;
    }
}
