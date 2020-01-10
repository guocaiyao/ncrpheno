package cn.edu.sysu.lilab.domain;

import lombok.Data;

import java.util.List;

/**
 * Author: gyao
 * Date: 1/9/20
 * E-mail: yaoguocai_cool@163.com
 **/
@Data
public class ncRNABasedInfo {
    private String Node;
    private String ncRPheDB_ID;
    private String Disease_Name;
    private String Ontology_ID;
    private String ncRNA_Symbol;
    private String Category;
    private String Species;
    private String Score;
    private List<ncRNA> ncRNAs;
}
