package cn.edu.sysu.lilab.dao;

import cn.edu.sysu.lilab.domain.Node;
import org.apache.ibatis.annotations.Select;

/**
 * Author: gyao
 * Date: 1/9/20
 * E-mail: yaoguocai_cool@163.com
 **/
public interface NodeDao {
    @Select(" SELECT * from Node_ncRPheDBid_ncRNA_Disease_Ontology_EvedentialValue " +
            "WHERE ncRPheDB_ID=#{associationId}")
    public Node findByAssociationId(String associationId) throws Exception;
}
