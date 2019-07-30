package com.hyekyeong.prom_manag.service;

import com.hyekyeong.prom_manag.domain.BoardAttachVO;
import com.hyekyeong.prom_manag.domain.Criteria;
import com.hyekyeong.prom_manag.domain.ManageVO;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface ManageService {

    //제품 관리 페이지 - 현재 판매중인 제품들에 대한 정보를 목록 형태로 보여준다
    public List<ManageVO> getList(Criteria cri);

    //페이징 처리에 사용
    public int getTotal(Criteria cri);


    //특정 상품 조회
    public ManageVO get(Long pm_mno);

    //상품 정보 수정
    public boolean modify(ManageVO board);

    //상품 정보를 등록
    public void register(ManageVO board);

    //서버로부터 첨부파일(상품 사진)을 가져온다
    public List<BoardAttachVO> getAttachList(Long pm_mno);

    //상품 정보를 삭제
    public boolean remove(Long pm_mno);

    //수량이 3개 이하인 상품들의 리스트를 리턴한다
    public List<ManageVO> orderList(Criteria cri);

}
