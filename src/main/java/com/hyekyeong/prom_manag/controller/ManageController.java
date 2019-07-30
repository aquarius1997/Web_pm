package com.hyekyeong.prom_manag.controller;

import com.hyekyeong.prom_manag.domain.BoardAttachVO;
import com.hyekyeong.prom_manag.domain.Criteria;
import com.hyekyeong.prom_manag.domain.ManageVO;
import com.hyekyeong.prom_manag.domain.PageDTO;
import com.hyekyeong.prom_manag.service.ManageService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;


//매장 관리 페이지에 대한 Controller
@Controller
@Log4j2
@RequestMapping("/board")
@AllArgsConstructor
public class ManageController {

    private ManageService services;

    //제품 관리 페이지 - 현재 판매중인 제품들에 대한 정보를 목록 형태로 보여준다
    @GetMapping("/list")
    public void manageList(Criteria cri, Model model){

        log.info("ManageController - manageList()");

        model.addAttribute("list", services.getList(cri));
        int total = services.getTotal(cri);
        log.info("total: " + total);

        model.addAttribute("pageMaker", new PageDTO(cri, total));
    }

    //제품 조회+수정 페이지
    @PreAuthorize("isAuthenticated()")
    @GetMapping({"/get", "/modify"})
    public void get(@RequestParam("pm_mno") Long pm_mno, @ModelAttribute("cri") Criteria cri, Model model){

        log.info("ManageController - get or modify");

        model.addAttribute("board", services.get(pm_mno));
    }

    //게시물 수정
    @PostMapping("/modify")
    @PreAuthorize("isAuthenticated()")
    public String modify(ManageVO board, Criteria cri, RedirectAttributes rttr) {
        log.info("ManageController - modify:" + board);

        if (services.modify(board)) {
            rttr.addFlashAttribute("result", "success");
        }

        return "redirect:/board/list" + cri.getListLink();
    }

    //상품 정보 등록 페이지로 이동
    @GetMapping("/register")
    @PreAuthorize("isAuthenticated()")
    public void register() {

    }

    //상품 정보를 등록한다
    @PostMapping("/register")
    @PreAuthorize("isAuthenticated()")
    public String register(ManageVO board, RedirectAttributes rttr) {

        log.info("ManageController - register()");

        log.info("register : " + board);

        if (board.getAttachList() != null) {

            board.getAttachList().forEach(attach -> log.info(attach));

        }

        log.info("==========================");

        services.register(board);

        rttr.addFlashAttribute("result", board.getPm_mno());

        return "redirect:/board/list";
    }

    //첨부파일과 관련된 테인터를 JSON으로 반환한다
    @GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ResponseEntity<List<BoardAttachVO>> getAttachList(Long pm_mno) {

        log.info("getAttachList " + pm_mno);

        return new ResponseEntity<>(services.getAttachList(pm_mno), HttpStatus.OK);

    }

    //상품정보를 삭제한다
    @PostMapping("/remove")
    @PreAuthorize("isAuthenticated()")
    public String remove(@RequestParam("pm_mno") Long pm_mno, Criteria cri, RedirectAttributes rttr) {

        log.info("remove..." + pm_mno);

        List<BoardAttachVO> attachList = services.getAttachList(pm_mno);

        if (services.remove(pm_mno)) {

            //첨부 파일을 삭제
            deleteFiles(attachList);

            rttr.addFlashAttribute("result", "success");
        }
        return "redirect:/board/list" + cri.getListLink();
    }

    //첨부 파일을 삭제한다
    private void deleteFiles(List<BoardAttachVO> attachList) {

        if (attachList == null || attachList.size() == 0) {
            return;
        }

        log.info("delete attach files...................");
        log.info(attachList);

        attachList.forEach(attach -> {
            try {
                Path file = Paths.get(
                        "C:\\upload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName());

                Files.deleteIfExists(file);

                if (Files.probeContentType(file).startsWith("image")) {

                    Path thumbNail = Paths.get("C:\\upload\\" + attach.getUploadPath() + "\\s_" + attach.getUuid() + "_"
                            + attach.getFileName());

                    Files.delete(thumbNail);
                }

            } catch (Exception e) {
                log.error("delete file error" + e.getMessage());
            } // end catch
        });// end foreachd
    }


    //제품 수량이 3개 이하인 상품들을 볼 수 있는 페이지
    @GetMapping("/order")
    public void order(Criteria cri, Model model){

        log.info("order method");

        model.addAttribute("list", services.orderList(cri));
        int total = services.getTotal(cri);
        log.info("total: " + total);

        model.addAttribute("pageMaker", new PageDTO(cri, total));
    }

}
