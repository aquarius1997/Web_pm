package com.hyekyeong.prom_manag.domain;

import lombok.Data;

@Data
public class AttachFileDTO {

    private String fileName;
    private String uploadPath;
    private String uuid;
    private boolean image;

}