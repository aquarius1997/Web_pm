package com.hyekyeong.prom_manag.domain;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class ManageVO {


    private Long pm_mno;            //주요키
    private String pm_title;        //타이틀
    private String pm_buy_f;        //사입처
    private String pm_buy_p;        //사입처 전화번호
    private Long pm_num;          //수량
    private String pm_text;         //상세정보
    private Date pm_regdate;      //등록 날짜
    private String pm_code;         //상품 코드

    private List<BoardAttachVO> attachList; //첨부파일들

}
