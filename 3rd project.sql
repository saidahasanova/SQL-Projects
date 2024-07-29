SELECT * FROM CUSTOMER;
SELECT * FROM CUSTOMER_ACCOUNTS;
SELECT * FROM BRANCHES;


/*Bütün müst?ril?r üzr?  qeyd olunan sütunlar ?ks olunan select ifad?si yazin :
1.müst?ri nömr?si
2. FULL_NAME=müst?rinin ?g?r individualdirsa adi  first last v? middle name birl?sdiril?r?k,?g?r corporate olduqda is? company_name sütunu istifad? olunaraq full name adi altinda ?ks olunsun.
3.reg_date=Individual müst?ri üçün dogum tarixi,corporate müst?ri üçün is? created date ?ks olunsun.
4.branch name
5.branch code 
6.Bütün Hesablarinin sayi
7.Bütün AZN Hesablarinin sayi
8.Bütün USD Hesablarinin sayi
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
    COUNT(C2.CUSTOMER_NO) AS "Bütün Hesablar?n?n say?",
    SUM(CASE WHEN C2.Currency = 'AZN' THEN 1 ELSE 0 END) AS "Bütün AZN Hesablar?n?n say?",
    SUM(CASE WHEN C2.Currency = 'USD' THEN 1 ELSE 0 END) AS "Bütün USD Hesablar?n?n say?"
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


