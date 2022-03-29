-- ��Ÿ�Լ��� ó��

/*
    ���� 1 ]
        �� ���޺��� �ѱ� ��������
        �������
            ����̸�, ����, �ѱ�����
        �� ��ȸ�ϼ���.
        
        MANAGER     : ������
        SALESMAN    : �������
        CLERK       : ����
*/
SELECT
    ename ����̸�, job ����,
    CASE WHEN job = 'ANALYST' THEN '�м���'
         WHEN job = 'CLERK' THEN '����'
         WHEN job = 'MANAGER' THEN '������'
         WHEN job = 'SALESMAN' THEN '�������'
         ELSE '����'
    END �ѱ�����
FROM
    emp
ORDER BY
    job DESC
;

/*
    ���� 2 ]
        �� �μ����� �̹��� ���ʽ��� �ٸ��� �����Ϸ��� �Ѵ�.
        10 �� �μ��� �޿��� 10%
        20 �� �μ��� �޿��� 15%
        30 �� �μ��� �޿��� 20% �� �����ϱ�� �ߴ�.
        �׸��� �ű⿡ ������ Ŀ�̼��� ���ؼ� �޿��� �����ϱ�� �ߴ�.
        Ŀ�̼��� ���� ����� Ŀ�̼��� 0���� �ؼ� ����ؼ�
        �������
            ����̸�, �μ���ȣ, �޿�, ���ޱ޿�
        �� ��ȸ�ϼ���.
*/

SELECT
    ename ����̸�, deptno �μ���ȣ, sal �޿�,
    CASE WHEN deptno = 10 THEN NVL2(comm, sal * 1.1 + comm, sal * 1.1)
         WHEN deptno = 20 THEN NVL2(comm, sal * 1.15 + comm, sal * 1.2)
         ELSE NVL2(comm, sal * 1.2 + comm, sal * 1.2)
    END ���ޱ޿�
FROM
    emp
;

/*
    ���� 3 ]
        �Ի�⵵�� �������� �ؼ�
            80�� 'A���'
            81�� 'B���'
            82�� 'C���'
            �̿� 'D���'
        ���� ��ȸ�ǵ��� �������
            ����̸�, ����, �Ի���, ���
        �� ��ȸ�ϼ���.
*/

SELECT
    ename ����̸�, job ����, hiredate �Ի���,
    CASE WHEN TO_CHAR(hiredate,'yy') = '80' THEN 'A���'
         WHEN TO_CHAR(hiredate,'yy') = '81' THEN 'B���'
         WHEN TO_CHAR(hiredate,'yy') = '82' THEN 'C���'
         ELSE 'D���'
    END ���
FROM
    emp
;


SELECT hiredate �Ի���,
        DECODE(TO_CHAR(hiredate,'yy'), '80', 'A���',
                    '81', 'B���',
                    '82', 'C���',
                    'D���') ���
FROM emp;                    


SELECT
    TO_CHAR(hiredate, 'YY')
FROM
    emp
;
/*
    ���� 4 ]
        ����̸��� ���ڼ��� 4���ڸ� 'Mr.'�� �̸��տ� ���̰�
        4���ڰ� �ƴϸ� �ڿ� ' ��'���� ��ȸ�ǵ���
        �������
            ����̸�, �̸����ڼ�, ��ȸ�̸�
        �� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, LENGTH(ename) �̸����ڼ�,
    CASE
        WHEN LENGTH(ename) = 4 THEN 'Mr.' || ename
        ELSE ename || '��'
    END ��ȸ�̸�
FROM
    emp
;

/*
    ���� 5 ]
        �μ���ȣ�� 10�� �Ǵ� 20���̸�  �޿� + Ŀ�̼����� �����ϰ�
        �� �̿��� �μ��� �޿��� �����Ϸ��� �Ѵ�.
        �������
            ����̸�, ����, �μ���ȣ, �޿�, Ŀ�̼�, ���ޱ޿�
        �� ��ȸ�ϼ���.
        ��, Ŀ�̼��� ���� ���� 0���� ����ؼ� �Ի��ϴ� ������ �Ѵ�.
*/

SELECT
    ename ����̸�, job ����, deptno �μ���ȣ, sal �޿�, comm Ŀ�̼�,
    CASE
        WHEN deptno = 10 or deptno = 20 THEN NVL2(comm, sal + comm, sal)
        ELSE sal
    END ���ޱ޿�
FROM
    emp
;

/*
    ���� 6 ]
        �Ի������ �����, �Ͽ��� �� �����
            �޿��� 20% ���ؼ� �����ϰ�
        �� �̿��� ���Ͽ� �Ի��� �����
            �޿��� 10%�� ���ؼ� �����Ϸ��� �Ѵ�.
            
        �������
            ����̸�, �޿�, �Ի���, �Ի����, ���ޱ޿�
        �� ��ȸ�ϼ���.
*/

SELECT
    ename ����̸�, sal �޿�, hiredate �Ի���,
    TO_CHAR(hiredate, 'day') �Ի����,
    CASE
        WHEN TO_CHAR(hiredate, 'day') = '�����' or
            TO_CHAR(hiredate, 'day') = '�Ͽ���' THEN sal * 1.2
        ELSE sal * 1.1
    END ���ޱ޿�
FROM
    emp
;


/*
    ���� 7 ]
        �ٹ��������� 490������ �̻��� �����
            Ŀ�̼��� 500 �� �߰��ؼ� �����ϰ�
        �ٹ��������� 490���� �̸��� �����
            Ŀ�̼��� ����Ŀ�̼Ǹ� �����ϵ��� �� �����̴�.
        �������
            ����̸�, Ŀ�̼�, �Ի���, �ٹ�������, ����Ŀ�̼�
        �� ��ȸ�ϼ���.
        ��, Ŀ�̼��� ���� ����� 0���� ����ϴ� ������ �Ѵ�.
*/

SELECT
    ename ����̸�, comm Ŀ�̼�, hiredate �Ի���,
    FLOOR(MONTHS_BETWEEN(sysdate, hiredate)) �ٹ�������,
    CASE
        WHEN FLOOR(MONTHS_BETWEEN(sysdate, hiredate)) >= 490 
        THEN NVL2(comm, comm + 500, 500)
        ELSE NVL2(comm, comm, 0)
    END ����Ŀ�̼�
FROM
    emp
;  

/*
    ���� 8 ]
        �̸� ���ڼ��� 5���� �̻��� ����� �̸���
            3����*** �� ǥ���ϰ�
        �̸� ���ڼ��� 4���� ������ ����� �״�� ����� �����̴�.
        ������� 
            ����̸�, �̸����ڼ�, ��ȸ�̸�
        �� ��ȸ�ϼ���.
*/

SELECT
    ename ����̸�, LENGTH(ename) �̸����ڼ�,
    CASE
        WHEN LENGTH(ename) >= 5 
        THEN RPAD((SUBSTR(ename, 1, 3)), LENGTH(ename),'*')
        ELSE ename
    END ��ȸ�̸�
FROM
    emp
;

SELECT ename, SUBSTR(ename, 1, 3), RPAD(SUBSTR(ename, 1, 3), LENGTH(ename), '*') FROM emp;
-------------------------------------------------------------------------------
-- group by

/*
    ���� 1 ]
        �� �μ����� �ּ� �޿��� ��ȸ�Ϸ��� �Ѵ�.
        ���μ���
            �μ���ȣ, �ּұ޿�
        �� ��ȸ�ϼ���.
*/
SELECT
    deptno �μ���ȣ, MIN(sal) �ּұ޿�
FROM
    emp
GROUP BY
    deptno
;
/*
    ���� 2 ]
        �� ���޺��� �޿��� �Ѿװ� ��ձ޿��� ���ް� �Բ� ��ȸ�ϼ���.
*/

SELECT
    SUM(sal) �Ѿ�, ROUND(AVG(sal)) ��ձ޿�, job ���� 
FROM
    emp
GROUP BY
    job
;

/*
    ���� 3 ]
        �Ի� �⵵���� ��� �޿��� �ѱ޿��� ��ȸ�ϼ���.
*/

SELECT
    AVG(sal) ��ձ޿�, SUM(sal) �ѱ޿�, TO_CHAR(hiredate,'YY') �Ի�⵵
FROM
    emp
GROUP BY
    hiredate
;

/*
    ���� 4 ]
        �� �⵵���� �Ի��� ������� ��ȸ�ϼ���.
*/

SELECT
    TO_CHAR(hiredate, 'yy') �⵵, COUNT(*)
FROM
    emp
GROUP BY
    TO_CHAR(hiredate, 'yy')
ORDER BY
    TO_CHAR(hiredate, 'yy')
;

/*
    ���� 5 ]
        ��� �̸��� ���ڼ��� �������� �׷�ȭ�ؼ� ��ȸ�Ϸ��� �Ѵ�.
        ��� �̸��� ���ڼ��� 4, 5 ������ ����� ���� ��ȸ�ϼ���.
*/

SELECT
    LENGTH(ename) �̸����ڼ�, COUNT(*) ����Ǽ�
FROM
    emp
GROUP BY
    LENGTH(ename)
HAVING
    LENGTH(ename) < 6
ORDER BY
    LENGTH(ename)
;    

/*
    ���� 6 ]
        81�⵵�� �Ի��� ����� ���� ���޺��� ��ȸ�ϼ���.
*/

SELECT
    job ����, COUNT(*)
FROM
    emp
WHERE
    TO_CHAR(hiredate, 'yy') = '81'
GROUP BY
    job

;

/*
    ���� 7 ]
        ����̸��� ���ڼ��� 4, 5������ ����� ���� �μ����� ��ȸ�ϼ���.
        ��, ������� �ѻ�� ������ �μ��� ��ȸ���� �����ϼ���.
*/

SELECT
    deptno �μ���ȣ, COUNT(*) ����Ǽ�
FROM
    emp
WHERE
    LENGTH(ename) = 4 or LENGTH(ename) = 5
GROUP BY
    deptno
HAVING
    COUNT(*) > 1
;

/*
    ���� 8 ]
        81�⵵ �Ի��� ����� ��ü �޿��� ���޺��� ��ȸ�ϼ���.
        ��, ���޺� ��� �޿��� 1000 �̸��� ������ ��ȸ���� �����ϼ���.
*/

SELECT
    SUM(sal) ��ü�޿�, ROUND(AVG(sal)) ��ձ޿�, job ���� 
FROM
    emp
WHERE
    TO_CHAR(hiredate, 'YY') = 81
GROUP BY
    job
HAVING
    AVG(sal) >= 1000
;

/*
    ���� 9 ]
        81�⵵ �Ի��� ����� �� �޿��� ����̸����ڼ� ���� �׷�ȭ�ϼ���.
        ��, �� �޿��� 2000 �̸��� ���� ��ȸ���� �����ϰ�
        �� �޿��� ���� �������� ���� ������� ��ȸ�ǰ� �ϼ���.
*/

SELECT
    SUM(sal) �ѱ޿�, LENGTH(ename) ����̸����ڼ�
FROM
    emp
WHERE
    TO_CHAR(hiredate, 'yy') = 81
GROUP BY
    LENGTH(ename)
HAVING
    SUM(sal) >= 2000
ORDER BY
    SUM(sal) DESC
;

/*
    ���� 10 ]
        ��� �̸� ���̰� 4, 5 ������ ����� �μ��� ������� ��ȸ�ϼ���.
        ��, ������� 0�� ���� ��ȸ���� �����ϰ�
        �μ���ȣ ������� ��ȸ�ϼ���.
*/

SELECT
    deptno �μ���ȣ, COUNT(*) �����
FROM
    emp
WHERE
    LENGTH(ename) = 4 or LENGTH(ename) = 5
GROUP BY
    deptno
HAVING
    COUNT(*) > 0 
ORDER BY
    deptno ASC
;