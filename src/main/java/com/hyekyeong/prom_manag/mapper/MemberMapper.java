package com.hyekyeong.prom_manag.mapper;

import com.hyekyeong.prom_manag.domain.MemberVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

@Component
@Mapper
public interface MemberMapper {

    public MemberVO read(String userid);

}
