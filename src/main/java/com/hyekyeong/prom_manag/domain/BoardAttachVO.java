package com.hyekyeong.prom_manag.domain;

import lombok.Data;

@Data
public class BoardAttachVO {

    private String uuid;
    private String uploadPath;
    private String fileName;
    private boolean fileType;

    private Long pm_mno;
}
