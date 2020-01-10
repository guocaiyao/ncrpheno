package cn.edu.sysu.lilab.domain;

import lombok.Data;

/**
 * Author: gyao
 * Date: 1/10/20
 * E-mail: yaoguocai_cool@163.com
 **/
@Data
public class Submission {
    private String ncRNA;
    private String disease;
    private String methods;
    private String PMID;
    private String expression;
    private String targets;
    private String SNPs;
    private String treatment;
    private String sample;
    private String description;
}
