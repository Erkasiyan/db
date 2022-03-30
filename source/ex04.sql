/*
    ���� 1 ]
        ������ MANAGER �� �����
        ����̸�, ����, �Ի���, �޿�, �μ��̸��� ��ȸ�ϼ���.
*/
SELECT
    e.ename ����̸�, e.job ����, e.hiredate �Ի���, e.sal �޿�, d.dname �μ��̸�
FROM
    emp e, dept d
WHERE
    e.deptno = d.deptno
;
/*
    ���� 2 ]
        ����̸��� 5������ �������
        ����̸�, ����, �Ի���, �޿�, �޿������ ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, e.job ����, e.hiredate �Ի���, e.sal �޿�, s.grade �޿����
FROM
    emp e, salgrade s
WHERE
    sal BETWEEN losal And hisal
    AND LENGTH(ename) = 5
;    
/*
    ���� 3 ]
        �Ի����� 81���̰�
        ������ MANAGER�� �������
        ����̸�, ����, �Ի���, �޿�, �޿����, �μ��̸�, �μ���ġ�� ��ȸ�ϼ���.
*/
    
SELECT
    e.ename ����̸�, e.job ����, e.hiredate �Ի���, e.sal �޿�,
    s.grade �޿����, d.dname �μ��̸�, d.loc �μ���ġ
FROM
    emp e, salgrade s, dept d
WHERE
    sal BETWEEN losal AND hisal
    AND e.deptno = d.deptno
;    
    
/*
    ���� 4 ]
        �������
        ����̸�, ����, �޿�, �޿����, ����̸�
        �� ��ȸ�ϼ���.
*/

SELECT
    e.ename ����̸�, e.job ����, e.sal �޿�, s.grade �޿����, h.ename ����̸�
FROM
    emp e, salgrade s, emp h
WHERE
    e.mgr = h.empno(+)
    AND e.sal BETWEEN losal AND hisal
;
/*
    ���� 5 ]
        �������
        ����̸�, ����, �޿�, ����̸�, �μ��̸�, �޿������ ��ȸ�ϼ���.
*/

SELECT
    e.ename ����̸�, e.job ����, e.sal �޿�, NVL(s.ename, '������') ����̸�,
    d.dname �μ��̸�, g.grade �޿����
FROM
    emp e, emp s, dept d, salgrade g
WHERE
    e.deptno = d.deptno
    AND e.mgr = s.empno(+)
    AND e.sal BETWEEN losal AND hisal
;
