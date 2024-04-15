-- 1) 유저 테이블
INSERT INTO user_tb ( id, password, type, user_email )
  VALUES ( 'cp1', '1234', 1, 'cp1@company.com' );
  
INSERT INTO user_tb ( id, password, type, user_email )
  VALUES ( 'cp2', '1234', 1, 'cp2@company.com' );

INSERT INTO user_tb ( id, password, type, user_email )
  VALUES ( 'cp3', '1234', 1, 'cp3@company.com' );

INSERT INTO user_tb ( id, password, type, user_email )
  VALUES ( 'ps1', '1234', 2, 'ps1@person.com' );

INSERT INTO user_tb ( id, password, type, user_email )
  VALUES ( 'ps2', '1234', 2, 'ps2@person.com' );

INSERT INTO user_tb ( id, password, type, user_email )
  VALUES ( 'ps3', '1234', 2, 'ps3@person.com' );


-- 2) 개인 회원 테이블
INSERT INTO person_info_tb ( id, pname, phone, address, birth )
  VALUES ( 'ps1', 'person1', '010-1111-1111', '서울광역시 강남구', '94/11/10' );

INSERT INTO person_info_tb ( id, pname, phone, address, birth )
  VALUES ( 'ps2', 'person2', '010-2222-2222', '부산광역시 연제구', '98/05/28' );

INSERT INTO person_info_tb ( id, pname, phone, address, birth )
  VALUES ( 'ps3', 'person3', '010-3333-3333', '울산광역시 남구', '98/05/28' );



-- 3) 기업 회원 테이블
INSERT INTO company_info_tb ( id, cnumber, cname, com_logo, crepresentive, address, manager_name, company_managerPhone, csize, cyear )
  VALUES ( 'cp1', 1, 'NAVER', '/images/naver.png', '최수현', '경기도 성남시', '김범준', '051-111-1111', '10', '99/06/02' );

INSERT INTO company_info_tb ( id, cnumber, cname, com_logo, crepresentive, address, manager_name, company_managerPhone, csize, cyear )
  VALUES ( 'cp2', 2, 'kakao', '/images/kakao.png', '권기수', '제주특별자치도 제주시', '장윤중', '051-222-2222', '9', '10/07/20' );

INSERT INTO company_info_tb ( id, cnumber, cname, com_logo, crepresentive, address, manager_name, company_managerPhone, csize, cyear )
  VALUES ( 'cp3', 3, '포스코DX', '/images/poscoDX.png', '정덕균', '경상북도 포항시', '김관리자', '054-280-1114', '2183', '89/11/18' );

INSERT INTO company_info_tb ( id, cnumber, cname, com_logo, crepresentive, address, manager_name, company_managerPhone, csize, cyear )
  VALUES ( 'cp4', 4, '카카오페이', '/images/kakao.png', '신원근', '경기도 성남시', '이관리자', '1644-7405', '715', '17/04/03' );

INSERT INTO company_info_tb ( id, cnumber, cname, com_logo, crepresentive, address, manager_name, company_managerPhone, csize, cyear )
  VALUES ( 'cp5', 5, '카카오뱅크', '/images/kakao.png', '윤호영', '경기도 성남시', '박관리자', '   02-6288-6000', '300', '16/01/22' );

INSERT INTO company_info_tb ( id, cnumber, cname, com_logo, crepresentive, address, manager_name, company_managerPhone, csize, cyear )
  VALUES ( 'cp6', 6, '카카오게임즈', '/images/카카오게임즈.png', '한상우', '   경기도 성남시', '조관리자', '1566-8834', '405', '10/07/20' );

INSERT INTO company_info_tb ( id, cnumber, cname, com_logo, crepresentive, address, manager_name, company_managerPhone, csize, cyear )
  VALUES ( 'cp7', 7, 'SK스퀘어', '/images/SK스퀘어.png', '박성하', '서울특별시 중구', '최관리자', '02-6100-3114', '5376', '21/11/02' );

INSERT INTO company_info_tb ( id, cnumber, cname, com_logo, crepresentive, address, manager_name, company_managerPhone, csize, cyear )
  VALUES ( 'cp8', 8, 'HD현대중공업', '/images/HD현대중공업.png', '이상균', '울산광역시 동구', '정관리자', '052-202-2114', '12639', '19/06/03' );

INSERT INTO company_info_tb ( id, cnumber, cname, com_logo, crepresentive, address, manager_name, company_managerPhone, csize, cyear )
  VALUES ( 'cp9', 9, '일진하이솔루스', '/images/일진하이솔루스.png', '양성모', '전라북도 완주군', '강관리자', '063-730-4602', '186', '12/11/02' );

INSERT INTO company_info_tb ( id, cnumber, cname, com_logo, crepresentive, address, manager_name, company_managerPhone, csize, cyear )
  VALUES ( 'cp10', 10, 'PI첨단소재', '/images/PI첨단소재.png', '송금수', '충청북도 진천군', '윤관리자', '02-2181-8600', '290', '08/06/02' );

INSERT INTO company_info_tb ( id, cnumber, cname, com_logo, crepresentive, address, manager_name, company_managerPhone, csize, cyear )
  VALUES ( 'cp11', 11, '에스디바이오센서', '/images/에스디바이오센서.png', '이효근', '경기도 수원시', '장관리자', '031-300-0400', '287', '10/12/27' );

INSERT INTO company_info_tb ( id, cnumber, cname, com_logo, crepresentive, address, manager_name, company_managerPhone, csize, cyear )
  VALUES ( 'cp12', 12, 'SK바이오사이언스', '/images/SK바이오사이언스.png', '안재용', '경기도 성남시', '임관리자', '02-2008-2136', '726', '18/07/01' );

INSERT INTO company_info_tb ( id, cnumber, cname, com_logo, crepresentive, address, manager_name, company_managerPhone, csize, cyear )
  VALUES ( 'cp13', 13, 'DL이앤씨', '/images/DL이앤씨.png', '마창민', '서울특별시 종로구', '황관리자', '02-2011-7114', '6157', '21/01/04' );

INSERT INTO company_info_tb ( id, cnumber, cname, com_logo, crepresentive, address, manager_name, company_managerPhone, csize, cyear )
  VALUES ( 'cp14', 14, '명신산업', '/images/명신산업.png', '최우철', '경상북도 경주시', '한관리자', '054-746-2665', '166', '82/04/17' );

INSERT INTO company_info_tb ( id, cnumber, cname, com_logo, crepresentive, address, manager_name, company_managerPhone, csize, cyear )
  VALUES ( 'cp15', 15, '하이브', '/images/하이브.png', '박지원', '서울특별시 용산구', '오관리자', '02-3334-0105', '762', '05/02/01' );


-- 4) 스킬 테이블
INSERT INTO skill_tb ( skill_idx, skill_name )
  VALUES ( 1, 'Java' );

INSERT INTO skill_tb ( skill_idx, skill_name )
  VALUES ( 2, 'Python' );

INSERT INTO skill_tb ( skill_idx, skill_name )
  VALUES ( 3, 'Spring' );

INSERT INTO skill_tb ( skill_idx, skill_name )
  VALUES ( 4, 'SQL' );

INSERT INTO skill_tb ( skill_idx, skill_name )
  VALUES ( 5, 'JavaScript' );

INSERT INTO skill_tb ( skill_idx, skill_name )
  VALUES ( 6, 'Html' );


-- 5) 구직자가 가진 스킬 테이블
INSERT INTO person_skill_tb ( psno, id, skill_idx )
  VALUES ( 12, 'cp1', 2 );

INSERT INTO person_skill_tb ( psno, id, skill_idx )
  VALUES ( 14, 'cp1', 4 );

INSERT INTO person_skill_tb ( psno, id, skill_idx )
  VALUES ( 21, 'cp2', 1 );

INSERT INTO person_skill_tb ( psno, id, skill_idx )
  VALUES ( 24, 'cp2', 4 );


-- 6) 기업 공고가 가진 스킬 테이블 : 기업 공고 테이블에 데이터를 먼저 생성을 해주고 데이터 생성을 해야한다
INSERT INTO post_skill_tb ( csno, post_idx, skill_idx )
  VALUES ( 1, 1, 1 );

INSERT INTO post_skill_tb ( csno, post_idx, skill_idx )
  VALUES ( 2, 2, 2 );


-- 7) 기업 공고 테이블
INSERT INTO job_post_tb ( post_idx, id, post_name, career, job_type, pay, go_work, go_home, deadline, job_intro, c_intro )
  VALUES ( 1, 'cp1', '내사람 구해요', '경력직', '정규직', '6000만원', '오전 9시', '오후 6시', '24/11/11', '네이버입니다', '프로그래밍' );

INSERT INTO job_post_tb ( post_idx, id, post_name, career, job_type, pay, go_work, go_home, deadline, job_intro, c_intro )
  VALUES ( 2, 'cp2', '같이 일할분 구해요', '신입', '정규직', '4000만원', '오전 9시', '오후 6시', '24/12/24', '카카오입니다', '프로그래밍' );


-- 8) 구직자가 지원한 공고 테이블 : 구직자 이력서 테이블에 데이터를 먼저 생성을 해주고 데이터 생성을 해야한다
INSERT INTO person_proposal_tb ( pro_idx, id, post_idx, resume_idx, status )
  VALUES ( 1, 'ps1', 2, 1, 3 );

INSERT INTO person_proposal_tb ( pro_idx, id, post_idx, resume_idx, status )
  VALUES ( 2, 'ps2', 1, 2, 1 );


-- 9) 구직자가 지원한 공고 테이블의 상태 테이블
-- status는 제가 임의로 대기 : 0 / 합격 : 1 / 불합격 : 2 으로 부여했습니다
INSERT INTO proposal_status_tb ( status_idx, id, pro_idx, post_idx, comments )
  VALUES ( 1, 'ps1', 1, 2, 0, '미처리중입니다' );

INSERT INTO proposal_status_tb ( status_idx, id, pro_idx, post_idx, comments )
  VALUES ( 2, 'ps2', 2, 1, 1, '합격했습니다' );


-- 10) 구직자 이력서 테이블
INSERT INTO resume_tb ( resume_idx, id, profile, title, portfolio, publish, self_intro )
  VALUES ( 1, 'ps1', '/', '저는 돌입니다', 'https://github.com/redrose', 1, '저는 열심히 부딪히면서 둥그렇게 변하는 돌처럼 뭐든 열심히 제것으로 만들어 할 수 있습니다' );

INSERT INTO resume_tb ( resume_idx, id, profile, title, portfolio, publish, self_intro )
  VALUES ( 2, 'ps2', '/', '저는 물입니다', 'https://github.com/2Shiro', 1, '저는 흘러가는 물처럼 모든 상황에 유연하게 대처할 수 있습니다' );


-- 11) 기업이 관심있어 하는 구직자 리스트
INSERT INTO com_scrap_tb ( cscrap_idx, cid, resume_idx )
  VALUES ( 1, 'cp2', 1 );

INSERT INTO com_scrap_tb ( cscrap_idx, cid, resume_idx )
  VALUES ( 2, 'cp1', 2 );


-- 12) 구직자과 관심있어 하는 기업 공고 리스트
INSERT INTO person_scrap_tb ( pscrap_idx, pid, post_idx )
  VALUES ( 1, 'ps2', 1 );

INSERT INTO person_scrap_tb ( pscrap_idx, pid, post_idx )
  VALUES ( 2, 'ps1', 2 );


-- 13) 고객센터 FAQ 테이블
INSERT INTO user_faq_tb ( q_idx, type, question, answer )
  VALUES ( 2, 2, '이력서에 사진이 안올라갑니다', '브라우저 창을 닫고 다시 실행해주세요' );

INSERT INTO user_faq_tb ( q_idx, type, question, answer )
  VALUES ( 1, 1, '공고페이지에 정보가 출력되지 않습니다', '일시적 오류입니다. 최대한 빠르게 해결하겠습니다' );





ALTER TABLE PERSON_SKILL_TB
ADD CONSTRAINT person_skill_unique UNIQUE (ID, SKILL_IDX);

ALTER TABLE POST_SKILL_TB
ADD CONSTRAINT post_skill_unique UNIQUE (POST_IDX, SKILL_IDX);

COMMIT;