package com.hyekyeong.prom_manag.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.util.UriComponentsBuilder;

//페이징 처리를 위한 클래스

@ToString
@Setter
@Getter
public class Criteria {

    private int pageNum;
    private int amount;

    private String type;
    private String keyword;

    public Criteria() {
        this(1, 10);
    }

    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
    }

    public String[] getTypeArr() {

        return type == null ? new String[] {} : type.split("");
    }

    public String getListLink() {

        UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
                .queryParam("pageNum", this.pageNum)
                .queryParam("amount", this.getAmount())
                .queryParam("type", this.getType())
                .queryParam("keyword", this.getKeyword());

        return builder.toUriString();

    }
}