# Web_pm
## (의류)상품 관리와 홍보를 위한 웹 프로젝트

의류 제품을 홍보할 수 있는 페이지와, 관리자 로그인을 통하여 상품을 관리(CRUD)할 수 있는 페이지들로 구성


페이지 처리 기능 추가


첨부파일(의류 사진) 등록 기능 추가

-------------------------------

## Prerequisites

* jdk1.8
* Spring Boot 2.x
  - JSP
  - Lombok
  - Spring Security
  - MVC Model
* Oracle DB
* Maven

--------------------------------

## Structure

1. Manage Table (제품 정보 저장)

2. User Table (사용자 정보 저장)

3. Auth Table (인증 정보 저장)

4. Attach Table (제품에 대한 첨부파일 정보 저장)

--------------------------------

## API URL
http://localhost:8080

### 상품 홍보 페이지 관련

| Method | Path | RequestParam | ResponseBody |
|:---:|:---:|:---:|:---:|
|GET|/promotion||상품 홍보 페이지|
|GET|/promotion/details|pm_mno|특정 상품 상세화면|

### 상품 관리 페이지 관련 ( + 로그인 )
| Method | Path | RequestParam | ResponseBody |
|:---:|:---:|:---:|:---:|
|GET|/board/list||전체 상품 목록 조회|
|GET|/board/get|pm_mno|특정 상품 조회|
|GET|/board/modify|pm_mno|상품 정보를 수정하기 위한 페이지 이동|
|POST|/board/modify||상품 정보 수정|
|GET|/board/register||상품 등록|
|POST|/board/remove|pm_mno|상품 삭제|
|GET|/board/order||수량이 3개 이하인 상품들을 조회|
|GET|/customLogin||로그인|
|GET|/customLogout||로그아웃 페이지|
|POST|/customLogout||로그아웃 실행|
|GET|/accessError||로그인 실패|
