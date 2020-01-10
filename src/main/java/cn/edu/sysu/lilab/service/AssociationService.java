package cn.edu.sysu.lilab.service;

import cn.edu.sysu.lilab.dao.AssociationDao;
import cn.edu.sysu.lilab.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Author: gyao
 * Date: 1/7/20
 * E-mail: yaoguocai_cool@163.com
 **/
@Service("AssociationService")
@Transactional
public class AssociationService {
    @Autowired
    private AssociationDao associationDao;

    public List<AssociationBasedInfo> queryByAssociationName(String ass_id) {
        return associationDao.queryByAssociationName(ass_id);
    }


    public List<DiseaseBasedInfo> queryByDiseaseAndType(String input_D, String selectedR) {
        return associationDao.queryByDiseaseAndType(input_D,selectedR);
    }

    public List<DiseaseBasedInfo> queryByDisease(String input_D) {
        return associationDao.queryByDisease(input_D);
    }

    public List<ncRNABasedInfo> queryByncRNA(String input_r, String selected) {
        return associationDao.queryByncRNA(input_r,selected);
    }

    public List<Node> diseaseBrowse(String disease) {
        return associationDao.diseaseBrowse(disease);
    }

    public List<Node> queryDiseaseandSpecies(String input_s, String selected) {
        return associationDao.queryDiseaseandSpecies(input_s,selected);
    }

    public ArrayList<Node> queryByOnencRNA(String ncRNAs, String selected) {
        String[] ncRNAarray=ncRNAs.replace(" ","").split(",");
        ArrayList<Node> resList=new ArrayList<>();
        for (String ncRNA:ncRNAarray){
            ArrayList<Node> list=associationDao.queryByOnencRNA(ncRNA,selected);
            if (CollectionUtils.isEmpty(list)){
                throw new RuntimeException(ncRNA+" query is not founde");
            }
            for (Node ls:list){
                resList.add(ls);
            }
        }
        return resList;
    }

    public ArrayList<Node> queryByncRNAandDisease(String input_rs, String input_d) {
        String[] ncRNAarray=input_rs.split(",");
        ArrayList<Node> resList=new ArrayList<>();
        for (String ncRNA:ncRNAarray){
            ArrayList<Node> list=associationDao.queryByncRNAandDisease(ncRNA,input_d);
            if (CollectionUtils.isEmpty(list)){
                throw new RuntimeException(ncRNA+" query is not founde");
            }
            for (Node ls:list){
                resList.add(ls);
            }
        }
        return resList;
    }
}
