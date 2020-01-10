package cn.edu.sysu.lilab.domain;

import lombok.Data;

/**
 * Author: gyao
 * Date: 1/9/20
 * E-mail: yaoguocai_cool@163.com
 **/
@Data
public class Node {
    private String Node;
    private String ncRPheDB_ID;
    private String Disease_Name;
    private String Ontology_ID;
    private String ncRNA_Symbol;
    private String Category;
    private String Species;
    private String Score;
}
