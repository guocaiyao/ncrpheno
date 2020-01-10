package cn.edu.sysu.lilab.domain;

import lombok.Data;

/**
 * Author: gyao
 * Date: 1/9/20
 * E-mail: yaoguocai_cool@163.com
 **/
@Data
public class ncRNA {
    private String ncRNA_Symbol;
    private String Category;
    private String Species;
    private String ncRNA_ID;
    private String SNPs;
    private String Targets;
    private String Ensembl;
}
