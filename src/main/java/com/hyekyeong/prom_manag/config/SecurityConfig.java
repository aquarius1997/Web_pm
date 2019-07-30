package com.hyekyeong.prom_manag.config;

import com.hyekyeong.prom_manag.security.CustomLoginSuccessHandler;
import com.hyekyeong.prom_manag.security.CustomUserDetailsService;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import javax.sql.DataSource;

@Configuration
@Log4j2
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Setter(onMethod_ = {@Autowired})
    private DataSource dataSource;

      //<security:http>의 관련 설정들을 대신한다
    @Override
    public void configure(HttpSecurity http) throws Exception{

        http.authorizeRequests()
                .antMatchers("/sample/all").permitAll()
                .antMatchers("/sample/admin").access("hasRole('ROLE_ADMIN')")
                .antMatchers("/sample/member").access("hasRole('ROLE_MEMBER')");


        //로그인 페이지로 이동해서 로그인
        http.formLogin().loginPage("/customLogin").loginProcessingUrl("/login").successHandler(loginSuccessHandler());
//        http.formLogin().loginPage("/customLogin").loginProcessingUrl("/login");


        //로그아웃 처리
        http.logout().logoutUrl("/customLogout").invalidateHttpSession(true).deleteCookies("remember-me", "JSESSION_ID");
//
        //자동로그인 설정
        http.rememberMe().key("hyekyeong").tokenRepository(persistentTokenRepository()).tokenValiditySeconds(604800);

    }

    //CustomLoginSuccessHandler 를 java 설정을 이용해서 추가
    @Bean
    public AuthenticationSuccessHandler loginSuccessHandler(){
        return new CustomLoginSuccessHandler();
    }

    //BcryptPasswordEncoder를 지정한다
    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }

    @Bean
    public UserDetailsService customUserService(){
        return new CustomUserDetailsService();
    }

    @Bean
    public PersistentTokenRepository persistentTokenRepository(){
        JdbcTokenRepositoryImpl repo = new JdbcTokenRepositoryImpl();
        repo.setDataSource(dataSource);
        return repo;
    }

    // in custom userdetails
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {

        //커스텀 UserDetailsService를 설정한다
        auth.userDetailsService(customUserService()).passwordEncoder(passwordEncoder());
    }
}
