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
<<<<<<< HEAD
  VALUES ( 'cp1', 1, 'NAVER', '/images/naver.png', '최수현', '경기도 성남시', '김범준', '051-111-1111', '10', '99/06/02' );
=======
  VALUES ( 'cp1', 1, 'NAVER', 'naver', '최수현', '경기도 성남시', '김범준', '051-111-1111', '10', '99/06/02' );
>>>>>>> branch 'develop' of https://github.com/2Shiro/HJSS.git

INSERT INTO company_info_tb ( id, cnumber, cname, com_logo, crepresentive, address, manager_name, company_managerPhone, csize, cyear )
<<<<<<< HEAD
  VALUES ( 'cp2', 2, 'kakao', '/images/kakao.png', '권기수', '제주특별자치도 제주시', '장윤중', '051-222-2222', '9', '10/07/20' );

INSERT INTO company_info_tb ( id, cnumber, cname, com_logo, crepresentive, address, manager_name, company_managerPhone, csize, cyear )
  VALUES ( 'cp3', 1, '포스코DX', '/images/poscoDX.png', '정덕균', '경상북도 포항시', '김관리자', '054-280-1114', '2183', '89/11/18' );

=======
  VALUES ( 'cp2', 2, 'kakao', 'kakao', '권기수', '제주특별자치도 제주시', '장윤중', '051-222-2222', '9', '10/07/20' );
>>>>>>> branch 'develop' of https://github.com/2Shiro/HJSS.git


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