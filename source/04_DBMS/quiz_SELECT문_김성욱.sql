-- 총 QUIZ

--1. EMP 테이블에서 sal이 3000이상인 사원의 empno, ename, job, sal을 출력
SELECT empno, ename, job, sal
   FROM emp
   WHERE sal >= 3000;
 
--2. EMP 테이블에서 empno가 7788인 사원의 ename과 deptno를 출력
SELECT ename, deptno
   FROM emp
   WHERE empno = 7788;
   
--3.	연봉(SAL*12+COMM)이 24000이상인 사번, 이름, 급여 출력 (급여순정렬)
SELECT empno, ename, sal
    FROM emp
    WHERE sal * 12 + NVL(comm, 0) >= 24000
    ORDER BY sal ASC;
    
--4.	입사일이 1981년 2월 20과 1981년 5월 1일 사이에 입사한 사원의 사원명, 직책, 입사일을 출력 (단 hiredate 순으로 출력)
SELECT ename, job, hiredate
    FROM emp
    WHERE hiredate BETWEEN DATE '1981-02-20' AND DATE '1981-05-01'
    ORDER BY hiredate ASC;
    
--5.	deptno가 10,20인 사원의 모든 정보를 출력 (단 ename순으로 정렬)
SELECT *
    FROM emp
    WHERE deptno IN (10, 20)
    ORDER BY ename ASC;
    
--6.	sal이 1500이상이고 deptno가 10,30인 사원의 ename과 sal를 출력
-- (단 출력되는 결과의 타이틀을 employee과 Monthly Salary로 출력)
SELECT ename AS "employee", sal AS "Monthly Salary"
    FROM emp
    WHERE sal >= 1500 AND deptno IN (10, 30);
      
-- 7.	hiredate가 1982년인 사원의 모든 정보를 출력
SELECT *
    FROM emp
    WHERE hiredate >= DATE '1982-01-01' AND hiredate <  DATE '1983-01-01';
    
-- 8.	입사일이81년이고 업무가 'SALESMAN'이 아닌 직원의 사번, 사원명, 입사일, 
--      업무, 급여를 검색하시오.
SELECT empno, ename, hiredate, job, sal
    FROM emp
    WHERE hiredate >= DATE '1981-01-01' 
        AND hiredate <  DATE '1982-01-01'
        AND job <> 'SALESMAN';
        
-- 9.	사번, 사원명, 입사일, 업무, 급여를 급여가 높은 순으로 정렬하고, 
--      급여가 같으면 입사일이 빠른 사원으로 정렬하시오.
SELECT empno, ename, hiredate, job, sal
    FROM emp
    ORDER BY sal DESC, hiredate ASC;
    
--10.	사원명의 세 번째 알파벳이 'N'인 사원의 사번, 사원명을 검색하시오
SELECT empno, ename
    FROM emp
    WHERE ename LIKE '__N%';

--11.	사원명에 'A'가 들어간 사원의 사번, 사원명을 출력
SELECT empno, ename
    FROM emp
    WHERE ename LIKE '%A%';
    
--12.	연봉(SAL*12)이 35000 이상인 사번, 사원명, 연봉을 검색 하시오.
SELECT empno, ename, sal * 12 AS annual_salary
    FROM emp
    WHERE sal * 12 >= 35000;







