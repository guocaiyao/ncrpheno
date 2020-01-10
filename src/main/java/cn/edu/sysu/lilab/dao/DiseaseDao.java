package cn.edu.sysu.lilab.dao;

import cn.edu.sysu.lilab.domain.Disease;
import org.apache.ibatis.annotations.Select;

/**
 * Author: gyao
 * Date: 1/8/20
 * E-mail: yaoguocai_cool@163.com
 **/
public interface DiseaseDao {
    @Select("select * from Disease_and_its_related_information " +
            "where Disease_Name=#{diseaseName}")
    public Disease findByDisease(String diseaseName) throws Exception;
}
