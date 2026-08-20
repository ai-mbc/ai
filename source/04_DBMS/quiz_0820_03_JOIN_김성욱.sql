-- ★ <연습문제>
  -- Part1(EQUI JOIN, NON EQUI JOIN)
    --1. 모든 사원에 대한 이름, 부서번호, 부서명을 출력하는 SELECT 문장을 작성하여라.
        SELECT E.ENAME,
               E.DEPTNO,
               D.DNAME
        FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO;
        
    --2. NEW YORK에서 근무하고 있는 사원에 대하여 이름, 업무, 급여, 부서명을 출력
        SELECT E.ENAME,
               E.JOB,
               E.SAL,
               D.DNAME
        FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO
          AND D.LOC = 'NEW YORK';
        
    --3. 보너스를 받는 사원에 대하여 이름,부서명,위치를 출력
        SELECT E.ENAME,
               D.DNAME,
               D.LOC
        FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO
          AND NVL(E.COMM, 0) > 0;
    
    --4. 이름 중 L자가 있는 사원에 대하여 이름,업무,부서명,위치를 출력
        SELECT E.ENAME,
               E.JOB,
               D.DNAME,
               D.LOC
        FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO
          AND E.ENAME LIKE '%L%';
    
    --5. 사번, 사원명, 급여, 부서명을 출력(단, 급여가 2000이상인 사원에 대하여 급여를 기준으로 내림차순 정렬)
        SELECT E.EMPNO,
               E.ENAME,
               E.SAL,
               D.DNAME
        FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO
          AND E.SAL >= 2000
        ORDER BY E.SAL DESC;
      
    --6. 사번, 사원명, 업무, 급여, 급여등급, 부서명을 출력(단, 업무가 MANAGER이며 급여가 2500이상인
    -- 사원에 대하여 사번을 기준으로 오름차순정렬)
        SELECT E.EMPNO,
               E.ENAME,
               E.JOB,
               E.SAL,
               S.GRADE,
               D.DNAME
        FROM EMP E, DEPT D, SALGRADE S
        WHERE E.DEPTNO = D.DEPTNO
          AND E.SAL BETWEEN S.LOSAL AND S.HISAL
          AND E.JOB = 'MANAGER'
          AND E.SAL >= 2500
        ORDER BY E.EMPNO ASC;
        
  -- Part2(4가지 JOIN 모두)
    --1. 이름, 급여, 업무, 직속상사명
        SELECT W.ENAME,
               W.SAL,
               W.JOB,
               M.ENAME AS MANAGER_NAME
        FROM EMP W, EMP M
        WHERE W.MGR = M.EMPNO;      
        
    --2. 이름, 급여, 업무, 직속상사명 . (상사가 없는 직원까지 전체 직원 다 출력. 상사가 없을 시 '없음'으로 출력)
        SELECT W.ENAME,
               W.SAL,
               W.JOB,
               NVL(M.ENAME, '없음') AS MANAGER_NAME
        FROM EMP W, EMP M
        WHERE W.MGR = M.EMPNO(+);
        
    --3. 이름, 급여, 부서명, 직속상사명
        SELECT W.ENAME,
               W.SAL,
               D.DNAME,
               M.ENAME AS MANAGER_NAME
        FROM EMP W, EMP M, DEPT D
        WHERE W.MGR = M.EMPNO
          AND W.DEPTNO = D.DEPTNO;
        
    --4. 상사가 없는 직원과 상사가 있는 직원 모두에 대해 이름, 급여, 부서코드, 부서명, 근무지, 직속상사명을 출력하시오(단, 직속상사가 없을 경우 직속상사명에는 ‘없음’으로 대신 출력하시오)
        SELECT W.ENAME,
               W.SAL,
               W.DEPTNO,
               D.DNAME,
               D.LOC,
               NVL(M.ENAME, '없음') AS MANAGER_NAME
        FROM EMP W, EMP M, DEPT D
        WHERE W.DEPTNO = D.DEPTNO
          AND W.MGR = M.EMPNO(+);
            
    --5. 이름, 급여, 등급, 부서명, 직속상사명. 급여가 2000이상인 사람
        SELECT W.ENAME,
               W.SAL,
               S.GRADE,
               D.DNAME,
               M.ENAME AS MANAGER_NAME
        FROM EMP W, EMP M, DEPT D, SALGRADE S
        WHERE W.MGR = M.EMPNO
          AND W.DEPTNO = D.DEPTNO
          AND W.SAL BETWEEN S.LOSAL AND S.HISAL
          AND W.SAL >= 2000;
    
    --6. 이름, 급여, 급여등급, 부서명, 연봉, 직속상사명. 연봉=(SAL+COMM)*12으로 계산하여 출력
        SELECT W.ENAME,
               W.SAL,
               S.GRADE,
               D.DNAME,
               NVL(M.ENAME, '없음') AS MANAGER_NAME
        FROM EMP W, EMP M, DEPT D, SALGRADE S
        WHERE W.MGR = M.EMPNO(+)
          AND W.DEPTNO = D.DEPTNO
          AND W.SAL BETWEEN S.LOSAL AND S.HISAL
          AND W.SAL >= 2000;
    
    --7. 6번을 부서명 순으로 오름차순 정렬하여 출력(부서가 같으면 급여가 큰 순 정렬)
        SELECT W.ENAME,
               W.SAL,
               S.GRADE,
               D.DNAME,
               (W.SAL + NVL(W.COMM, 0)) * 12 AS ANNUAL_SAL,
               M.ENAME AS MANAGER_NAME
        FROM EMP W, EMP M, DEPT D, SALGRADE S
        WHERE W.MGR = M.EMPNO
          AND W.DEPTNO = D.DEPTNO
          AND W.SAL BETWEEN S.LOSAL AND S.HISAL
        ORDER BY D.DNAME ASC,
                 W.SAL DESC;