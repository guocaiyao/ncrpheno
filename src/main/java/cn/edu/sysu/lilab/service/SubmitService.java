package cn.edu.sysu.lilab.service;

import cn.edu.sysu.lilab.dao.SubmitDao;
import cn.edu.sysu.lilab.domain.Submission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Author: gyao
 * Date: 1/10/20
 * E-mail: yaoguocai_cool@163.com
 **/
@Service
@Transactional
public class SubmitService {
    @Autowired
    private SubmitDao submitDao;

    public String submit(Submission submission) {
        submitDao.save(submission);
        return "success";
    }
}
