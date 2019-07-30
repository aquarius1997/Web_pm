package com.hyekyeong.prom_manag.service;

import com.hyekyeong.prom_manag.domain.BoardAttachVO;
import com.hyekyeong.prom_manag.domain.Criteria;
import com.hyekyeong.prom_manag.domain.ManageVO;
import com.hyekyeong.prom_manag.mapper.BoardAttachMapper;
import com.hyekyeong.prom_manag.mapper.ManageMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@AllArgsConstructor
@Component
@Service
@Log4j2
public class ManageServiceImpl implements ManageService{

    @Setter(onMethod_ = @Autowired)
    private ManageMapper mapper;

    @Setter(onMethod_ = @Autowired)
    private BoardAttachMapper attachMapper;

    //제품 관리 페이지 - 현재 판매중인 제품들에 대한 정보를 목록 형태로 보여준다
    public List<ManageVO> getList(Criteria cri){
        log.info("PromotionServiceImpl - getList()");

        return mapper.getListWithPaging(cri);

    }


    //전체 게시물의 개수 구하기
    @Override
    public int getTotal(Criteria cri){

        log.info("ManageServiceImpl - get total count");
        return mapper.getTotalCount(cri);
    }

    //특정 게시물 조회
    @Override
    public ManageVO get(Long pm_mno){

        log.info("ManageServiceImpl - get() mno : " + pm_mno);

        return mapper.read(pm_mno);
    }

    //게시물 수정
    @Transactional
    @Override
    public boolean modify(ManageVO board) {

        log.info("ManageServiceImpl - modify() board : " + board);

        //첨부파일 목록을 모두 삭제한 후에
        attachMapper.deleteAll(board.getPm_mno());

        //다시 첨부파일 목록을 추가한다
        boolean modifyResult = mapper.update(board) == 1;

       if (modifyResult && board.getAttachList() != null) {

            board.getAttachList().forEach(attach -> {

                attach.setPm_mno(board.getPm_mno());
                attachMapper.insert(attach);
            });
        }

        return modifyResult;
    }


    //게시물 등록
    @Transactional
    @Override
    public void register(ManageVO board) {

        log.info("register......" + board);

        mapper.insertSelectKey(board);

        if (board.getAttachList() == null || board.getAttachList().size() <= 0) {
            return;
        }

        board.getAttachList().forEach(attach -> {

            attach.setPm_mno(board.getPm_mno());
            attachMapper.insert(attach);
        });
    }

    //첨부파일 리스트를 가져온다
    @Override
    public List<BoardAttachVO> getAttachList(Long pm_mno) {

        log.info("get Attach list by mno" + pm_mno);

        return attachMapper.findByMno(pm_mno);
    }

    //게시물을 삭제한다
    //Transaction을 통해 첨부파일이 같이 삭제되도록 한다. 삭제가 올바르게 진행되면 1 이상의 값을 리턴
    @Transactional
    @Override
    public boolean remove(Long pm_mno) {

        log.info("remove...." + pm_mno);

        attachMapper.deleteAll(pm_mno);

        return mapper.delete(pm_mno) == 1;
    }

    //수량이 3개 이하인 상품들의 리스트를 리턴한다
    public List<ManageVO> orderList(Criteria cri){

        log.info("orderList()");

        return mapper.getOrderList(cri);
    }



}
