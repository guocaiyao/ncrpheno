package cn.edu.sysu.lilab.dao;

import cn.edu.sysu.lilab.domain.ncRNA;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Author: gyao
 * Date: 1/9/20
 * E-mail: yaoguocai_cool@163.com
 **/
public interface ncRNADao {
    @Select("SELECT * FROM ncRNA_and_its_related_information " +
            "WHERE ncRNA_Symbol=#{symbol}")
    public List<ncRNA> findBySymbol(String symbol) throws Exception;
}
