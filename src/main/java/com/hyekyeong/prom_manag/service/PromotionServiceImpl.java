package com.hyekyeong.prom_manag.service;

import com.hyekyeong.prom_manag.domain.AttachFileDTO;
import com.hyekyeong.prom_manag.domain.BoardAttachVO;
import com.hyekyeong.prom_manag.domain.ManageVO;
import com.hyekyeong.prom_manag.mapper.BoardAttachMapper;
import com.hyekyeong.prom_manag.mapper.ManageMapper;
import com.hyekyeong.prom_manag.mapper.PromotionMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@AllArgsConstructor
@Component
@Service
@Log4j2
public class PromotionServiceImpl implements PromotionService{

    @Setter(onMethod_ = @Autowired)
    private ManageMapper mapper;

    @Setter(onMethod_ = @Autowired)
    private BoardAttachMapper attachMapper;

    //홍보 메인 화면을 보여준다
    @Override
    public List<BoardAttachVO> getList(){

        log.info("PromotionServiceImpl - getList()");

        return attachMapper.show_all();
    }

    //홍보 상품의 디테일을 조회한다
    @Override
    public ManageVO get(Long pm_pno){

        log.info("PromotionServiceImpl - get()");

        return mapper.read(pm_pno);

    };

    //홍보 상품의 첨부 파일을 가져온다
    @Override
    public List<BoardAttachVO> getAttachListP(Long pm_mno){

        log.info("get Attach list by pm_mno : "  + pm_mno);

        return attachMapper.findByMno(pm_mno);
    }
}
