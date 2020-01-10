package cn.edu.sysu.lilab.dao;

import cn.edu.sysu.lilab.domain.*;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

/**
 * Author: gyao
 * Date: 1/7/20
 * E-mail: yaoguocai_cool@163.com
 **/
@Repository
public interface AssociationDao {
    /**sql = "select * from ncRPid_PMID_evidence_information_data_sources a," +
            "Node_ncRPheDBid_ncRNA_Disease_Ontology_EvedentialValue b," +
            "ncRNA_and_its_related_information c," +
            "Disease_and_its_related_information d " +
            "where a.ncRPheDB_ID=b.ncRPheDB_ID and a.ncRPheDB_ID = ? " +
            "and b.ncRNA_Symbol=c.ncRNA_Symbol and " +
            "b.Disease_Name =d.Disease_Name order BY PMID +0 DESC"**/

    @Select("select * from ncRPid_PMID_evidence_information_data_sources " +
            "where ncRPheDB_ID=#{associationName} ORDER BY PMID DESC")
    @Results({
            @Result(property = "ncRPheDB_ID",column = "ncRPheDB_ID"),
            @Result(property = "ncRNA_Symbol",column = "ncRNA_Symbol"),
            @Result(property = "PMID",column = "PMID"),
            @Result(property = "Disease_Name_1",column = "Disease_Name_1"),
            @Result(property = "Expression_pattern_or_Mutation",column = "Expression_pattern_or_Mutation"),
            @Result(property = "ECO",column = "ECO"),
            @Result(property = "Methods",column = "Methods"),
            @Result(property = "Sample_Name",column = "Sample_Name"),
            @Result(property = "Target",column = "Target"),
            @Result(property = "Treatment",column = "Treatment"),
            @Result(property = "Description",column = "Description"),
            @Result(property = "Datasources",column = "Datasources"),
            @Result(property = "Title",column = "Title"),
            @Result(property = "node",column = "ncRPheDB_ID",javaType = Node.class,
                    one = @One(select = "cn.edu.sysu.lilab.dao.NodeDao.findByAssociationId")),
            @Result(property = "ncRNAs",column = "ncRNA_Symbol",javaType = java.util.List.class,
            many = @Many(select = "cn.edu.sysu.lilab.dao.ncRNADao.findBySymbol")),
            @Result(property = "disease",column = "Disease_Name_1",javaType = Disease.class,
                    one = @One(select = "cn.edu.sysu.lilab.dao.DiseaseDao.findByDisease"))
    })
    List<AssociationBasedInfo> queryByAssociationName(String associationName);


//    " select * from Node_ncRPheDBid_ncRNA_Disease_Ontology_EvedentialValue a, " +
//            "Disease_and_its_related_information b " +
//            "where a.Disease_Name = b.Disease_Name and a.Disease_Name = #{inputD} " +
//            "and a.Category = #{selectedR} order by Score + 0 DESC"
    @Select("select * from Node_ncRPheDBid_ncRNA_Disease_Ontology_EvedentialValue " +
            "where Disease_Name=#{input_D} and Category=#{selectR} ORDER BY Score desc")
    @Results({
            @Result(property = "Node",column = "Node"),
            @Result(property = "Disease_Name",column = "Disease_Name"),
            @Result(property = "ncRPheDB_ID",column = "ncRPheDB_ID"),
            @Result(property = "Ontology_ID",column = "Ontology_ID"),
            @Result(property = "ncRNA_Symbol",column = "ncRNA_Symbol"),
            @Result(property = "Category",column = "Category"),
            @Result(property = "Species",column = "Species"),
            @Result(property = "Score",column = "Score"),
            @Result(property = "disease",column = "Disease_Name",javaType = Disease.class,
            one = @One(select = "cn.edu.sysu.lilab.dao.DiseaseDao.findByDisease"))
    })
    List<DiseaseBasedInfo> queryByDiseaseAndType(
            @Param("input_D") String input_D, @Param("selectR") String selectedR);

    @Select("select * from Node_ncRPheDBid_ncRNA_Disease_Ontology_EvedentialValue " +
            "where Disease_Name=#{input_D} ORDER BY Score desc")
    @Results({
            @Result(property = "Node",column = "Node"),
            @Result(property = "Disease_Name",column = "Disease_Name"),
            @Result(property = "ncRPheDB_ID",column = "ncRPheDB_ID"),
            @Result(property = "Ontology_ID",column = "Ontology_ID"),
            @Result(property = "ncRNA_Symbol",column = "ncRNA_Symbol"),
            @Result(property = "Category",column = "Category"),
            @Result(property = "Species",column = "Species"),
            @Result(property = "Score",column = "Score"),
            @Result(property = "disease",column = "Disease_Name",javaType = Disease.class,
                    one = @One(select = "cn.edu.sysu.lilab.dao.DiseaseDao.findByDisease"))
    })
    List<DiseaseBasedInfo> queryByDisease(String input_D);

    @Select("select * from Node_ncRPheDBid_ncRNA_Disease_Ontology_EvedentialValue " +
            "where ncRNA_Symbol=#{input_r} and Species=#{selected} order by Score DESC")
    @Results({
            @Result(property = "Node",column = "Node"),
            @Result(property = "Disease_Name",column = "Disease_Name"),
            @Result(property = "ncRPheDB_ID",column = "ncRPheDB_ID"),
            @Result(property = "Ontology_ID",column = "Ontology_ID"),
            @Result(property = "ncRNA_Symbol",column = "ncRNA_Symbol"),
            @Result(property = "Category",column = "Category"),
            @Result(property = "Species",column = "Species"),
            @Result(property = "Score",column = "Score"),
            @Result(property = "ncRNAs",column = "ncRNA_Symbol",javaType = java.util.List.class,
                    many = @Many(select = "cn.edu.sysu.lilab.dao.ncRNADao.findBySymbol"))
    })
    List<ncRNABasedInfo> queryByncRNA(
            @Param("input_r") String input_r, @Param("selected") String selected);

    @Select("select * from Node_ncRPheDBid_ncRNA_Disease_Ontology_EvedentialValue " +
            "where Disease_Name=#{disease} order by Score DESC")
    List<Node> diseaseBrowse(String disease);

    @Select("select * from Node_ncRPheDBid_ncRNA_Disease_Ontology_EvedentialValue " +
            "where Disease_Name=#{input_s} and Species=#{selected} order by Score DESC")
    List<Node> queryDiseaseandSpecies(
            @Param("input_s") String input_s, @Param("selected") String selected);

    @Select("select * from Node_ncRPheDBid_ncRNA_Disease_Ontology_EvedentialValue " +
            "where ncRNA_Symbol=#{ncRNA} and Species=#{selected} order by Score DESC")
    ArrayList<Node> queryByOnencRNA(
            @Param("ncRNA") String ncRNA, @Param("selected") String selected);

    @Select("select * from Node_ncRPheDBid_ncRNA_Disease_Ontology_EvedentialValue " +
            "where ncRNA_Symbol=#{ncRNA} and Disease_Name=#{input_d}")
    ArrayList<Node> queryByncRNAandDisease(
            @Param("ncRNA") String ncRNA, @Param("input_d") String input_d);
}
