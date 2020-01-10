package cn.edu.sysu.lilab.domain;

import lombok.Data;

/**
 * Author: gyao
 * Date: 1/8/20
 * E-mail: yaoguocai_cool@163.com
 **/
@Data
public class Disease {
    private String Disease_Name;
    private String Ontology_ID;
    private String Definition;
    private String AlternativeName;
}
