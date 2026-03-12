-- 1번
SELECT rt.idx AS "대여번호"
     , mt.names AS "회원명"
     , bt.names AS "책제목"
     , rt.rentaldate AS "대여일"
  FROM rentaltbl rt, membertbl mt, bookstbl bt
 WHERE rt.memberidx = mt.idx
   AND rt.bookidx = bt.idx
   AND rt.returndate IS NULL
 ORDER BY rt.idx; 

-- 2번
SELECT dt.division AS "분류코드"
     , dt.names AS "분류명"
     , count(bt.idx) AS "도서수"   -- count(*) 사용안됨!
  FROM divtbl dt
  LEFT OUTER JOIN bookstbl bt  
    ON dt.division = bt.division
 GROUP BY dt.division, dt.names;

-- 3번
SELECT bt.idx AS "책번호"
     , bt.names AS "책제목"
     , count(rt.idx) AS "대여횟수"
  FROM bookstbl bt, rentaltbl rt
 WHERE bt.idx = rt.bookidx
 GROUP BY bt.idx, bt.names
 ORDER BY count(rt.idx) DESC, bt.idx;

-- 4번 
SELECT mt.idx AS "회원번호"
     , mt.names AS "회원명"
     , mt.levels AS "등급"
     , count(rt.idx) AS "대여횟수"
  FROM membertbl mt, rentaltbl rt
 WHERE mt.idx = rt.memberidx (+)
 GROUP BY mt.idx, mt.names, mt.levels
HAVING count(rt.idx) > 1
 ORDER BY mt.idx;

-- 5번
SELECT rt.idx AS "대여번호"
     , mt.names AS "회원명"
     , bt.names AS "책제목"
     , to_char(rt.rentaldate, 'yyyy-mm-dd') AS "대여일"
     , to_char(rt.returndate, 'YYYY-MM-DD') AS "반납일"
  FROM rentaltbl rt, membertbl mt, bookstbl bt
 WHERE rt.memberidx = mt.idx
   AND rt.bookidx = bt.idx
   AND rt.rentaldate > rt.returndate;