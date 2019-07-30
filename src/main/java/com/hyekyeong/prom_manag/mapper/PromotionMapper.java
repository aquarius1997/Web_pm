package com.hyekyeong.prom_manag.mapper;

import com.hyekyeong.prom_manag.domain.ManageVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface PromotionMapper {

    //이번 달 프로모션할 상품들의 리스트를 리턴한다
    public List<ManageVO> getList();

    //홍보 상품의 디테일 정보를 리턴한다
    public ManageVO read(Long pm_mno);


}
