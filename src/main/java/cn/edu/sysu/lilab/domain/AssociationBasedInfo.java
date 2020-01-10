package cn.edu.sysu.lilab.domain;

import lombok.Data;

import java.util.List;

/**
 * Author: gyao
 * Date: 1/9/20
 * E-mail: yaoguocai_cool@163.com
 **/
@Data
public class AssociationBasedInfo {
    private String ncRPheDB_ID;
    private String ncRNA_Symbol;
    private String PMID;
    private String Disease_Name_1;
    private String Expression_pattern_or_Mutation;
    private String ECO;
    private String Methods;
    private String Sample_Name;
    private String Target;
    private String Treatment;
    private String Description;
    private String Datasources;
    private String Title;
    private Node node;
    private List<ncRNA> ncRNAs;
    private Disease disease;
}
