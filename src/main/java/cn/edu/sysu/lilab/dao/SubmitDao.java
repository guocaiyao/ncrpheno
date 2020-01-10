package cn.edu.sysu.lilab.dao;

import cn.edu.sysu.lilab.domain.Submission;
import org.apache.ibatis.annotations.Insert;

/**
 * Author: gyao
 * Date: 1/10/20
 * E-mail: yaoguocai_cool@163.com
 **/
public interface SubmitDao {
    @Insert("insert into submission(ncRNA,disease,methods,PMID,expression,targets,SNPs,treatment,sample,description) " +
            "values(#{ncRNA},#{disease},#{methods},#{PMID},#{expression},#{targets},#{SNPs},#{treatment},#{sample},#{description})")
    void save(Submission submission);
}
