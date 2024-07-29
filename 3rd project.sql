SELECT * FROM CUSTOMER;
SELECT * FROM CUSTOMER_ACCOUNTS;
SELECT * FROM BRANCHES;


/*B�t�n m�st?ril?r �zr?  qeyd olunan s�tunlar ?ks olunan select ifad?si yazin :
1.m�st?ri n�mr?si
2. FULL_NAME=m�st?rinin ?g?r individualdirsa adi  first last v? middle name birl?sdiril?r?k,?g?r corporate olduqda is? company_name s�tunu istifad? olunaraq full name adi altinda ?ks olunsun.
3.reg_date=Individual m�st?ri ���n dogum tarixi,corporate m�st?ri ���n is? created date ?ks olunsun.
4.branch name
5.branch code 
6.B�t�n Hesablarinin sayi
7.B�t�n AZN Hesablarinin sayi
8.B�t�n USD Hesablarinin sayi
*/


SELECT * FROM CUSTOMER C1
 LEFT JOIN CUSTOMER_ACCOUNTS C2 ON C1.CUSTOMER_ID=C2.CUSTOMER_NO
LEFT JOIN BRANCHES C3 ON C2.BRANCH_CODE = C3.ID ;



SELECT
    C2.CUSTOMER_NO,
    CASE 
        WHEN C1.GROUP_CODE = 'IND' THEN C1.FIRST_NAME || ' ' || C1.LAST_NAME || ' ' ||C1.MIDDLE_NAME
        WHEN C1.GROUP_CODE = 'CORP' THEN C1.COMPANY_NAME
  ELSE NULL
    END AS FULL_NAME,
    CASE 
        WHEN C1.GROUP_CODE = 'IND' THEN C1.BIRTH_DATE
        WHEN C1.GROUP_CODE = 'CORP' THEN C1.CREATION_DATE
    ELSE NULL
    END AS REG_DATE,
    C3.BRANCH_NAME_AZ,
    C2.BRANCH_CODE,
    COUNT(C2.CUSTOMER_NO) AS "B�t�n Hesablar?n?n say?",
    SUM(CASE WHEN C2.Currency = 'AZN' THEN 1 ELSE 0 END) AS "B�t�n AZN Hesablar?n?n say?",
    SUM(CASE WHEN C2.Currency = 'USD' THEN 1 ELSE 0 END) AS "B�t�n USD Hesablar?n?n say?"
FROM 
    CUSTOMER C1
   LEFT JOIN CUSTOMER_ACCOUNTS C2 ON C1.CUSTOMER_ID=C2.CUSTOMER_NO
   LEFT JOIN BRANCHES C3 ON C2.BRANCH_CODE = C3.ID
   GROUP BY
    C2.CUSTOMER_NO,
    C1.GROUP_CODE,
    C1.FIRST_NAME,
    C1.LAST_NAME,
    C1.MIDDLE_NAME,
    C1.COMPANY_NAME,
    C1.BIRTH_DATE,
    C1.CREATION_DATE,
    C3.BRANCH_NAME_AZ,
    C2.BRANCH_CODE;


