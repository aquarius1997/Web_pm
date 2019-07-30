package com.hyekyeong.prom_manag.service;

import com.hyekyeong.prom_manag.domain.AttachFileDTO;
import com.hyekyeong.prom_manag.domain.BoardAttachVO;
import com.hyekyeong.prom_manag.domain.ManageVO;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface PromotionService {

    //홍보 메인 화면을 보여준다
    public List<BoardAttachVO> getList();

    //홍보 상품의 디테일을 조회한다
    public ManageVO get(Long pm_pno);

    //홍보 상품의 첨부 파일을 가져온다
    public List<BoardAttachVO> getAttachListP(Long pm_mno);

}
