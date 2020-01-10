package cn.edu.sysu.lilab.controller;

import cn.edu.sysu.lilab.domain.Submission;
import cn.edu.sysu.lilab.service.SubmitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.print.SunMinMaxPage;

/**
 * Author: gyao
 * Date: 1/10/20
 * E-mail: yaoguocai_cool@163.com
 **/
@Controller
@RequestMapping("ncrphedb")
public class SubmitController {
    @Autowired
    private SubmitService submitService;
    @ResponseBody
    @RequestMapping("/submit")
    public String submit(
            @RequestParam String ncRNA, @RequestParam String disease,
            @RequestParam String sample, @RequestParam String methods,
            @RequestParam String PMID, @RequestParam String expression,
            @RequestParam String target, @RequestParam String SNP,
            @RequestParam String treatment,@RequestParam String description
    )throws Exception{
        Submission submission = new Submission();
        submission.setNcRNA(ncRNA);
        submission.setDisease(disease);
        submission.setSample(sample);
        submission.setMethods(methods);
        submission.setPMID(PMID);
        submission.setExpression(expression);
        submission.setTargets(target);
        submission.setSNPs(SNP);
        submission.setTreatment(treatment);
        submission.setDescription(description);

        String info=submitService.submit(submission);
        return info;
    }
}
