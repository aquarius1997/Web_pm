package com.hyekyeong.prom_manag.mapper;

import com.hyekyeong.prom_manag.domain.Criteria;
import com.hyekyeong.prom_manag.domain.ManageVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface ManageMapper {

    //게시물 전체 개수를 구한다
    public int getTotalCount(Criteria cri);

    //이번 달 프로모션할 상품들의 리스트를 리턴한다
    public List<ManageVO> getListWithPaging(Criteria cri);

    //특정 상품을 조회한다
    public ManageVO read(Long pm_mno);

    //상품 정보 페이지를 수정한다
    public int update(ManageVO board);

    //상품 정보 등록
    public Integer insertSelectKey(ManageVO board);

    //상품 정보를 삭제
    public int delete(Long pm_mno);

    //수량이 3개 이하인 상품들의 리스트를 리턴한다
    public List<ManageVO> getOrderList(Criteria cri);


}
