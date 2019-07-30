package com.hyekyeong.prom_manag.mapper;

import com.hyekyeong.prom_manag.domain.AttachFileDTO;
import com.hyekyeong.prom_manag.domain.BoardAttachVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface BoardAttachMapper {

    //전체 게시물의 사진들을 보여준다
    public List<BoardAttachVO> show_all();

    public void insert(BoardAttachVO vo);

    public void delete(String uuid);

    public List<BoardAttachVO> findByMno(Long pm_mno);

    public void deleteAll(Long pm_mno);

    public List<BoardAttachVO> getOldFiles();

}