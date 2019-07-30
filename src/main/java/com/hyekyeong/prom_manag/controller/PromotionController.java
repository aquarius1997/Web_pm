package com.hyekyeong.prom_manag.controller;

import com.hyekyeong.prom_manag.domain.BoardAttachVO;
import com.hyekyeong.prom_manag.service.PromotionService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


//의류제품 홍보 페이지 Controller
@Controller
@Log4j2
@RequestMapping("/promotion")
@AllArgsConstructor
public class PromotionController {

    private PromotionService services;

    //홍보 메인 화면
    @GetMapping("")
    public void list(Model model){

        log.info("PromotionController - list()");


        model.addAttribute("list", services.getList());


    }

//    //첨부파일을 가져온다
//    @GetMapping(value="/getAttachListP", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
//    @ResponseBody
//    public ResponseEntity<List<BoardAttachVO>> getAttachListP(Long pm_mno){
//        log.info("getAttachList2() ");
//
//        return new ResponseEntity<>(services.getAttachListP(pm_mno), HttpStatus.OK);
//
//    }

    //홍보 상세화면
    @GetMapping("/details")
    public void details(@RequestParam("pm_pno") Long pm_mno, Model model){

        log.info("PromotionController - details()");

        model.addAttribute("board", services.get(pm_mno));
    }


}
