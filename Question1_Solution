
DECLARE 
 
/* declare job_sal record type that has two fields:  
     1- job_title of the same type as jobs.job_title 
     2- job_avg of the same type as employees.salary 
*/ 
    TYPE job_sal IS RECORD ( job_title hr.jobs.job_title%TYPE, 
                             job_avg   hr.employees.salary%TYPE ); 
 
/* declare a nested table type  nestedRslt where the elements are of the record type job_sal*/ 
    TYPE nestedrslt IS TABLE OF job_sal; 
 /* /* declare a nested table job_avg_sal_nested of type nestedRslt*/ 
    job_avg_sal_nested  nestedrslt; 
    
/* declare an associative array type job_associative_type where the key is job title and the value is average salary 
    declare an associative array job_avg_sal of the type job_associative_type*/ 
         
    TYPE job_associative_type IS TABLE OF hr.employees.salary%TYPE  
    INDEX BY hr.jobs.job_title%TYPE; 
    job_avg_sal  job_associative_type; 
  
 /* declare counter1 to loop through the nested table*/ 
 /* declare counter2 to loop through the associative array*/ 
     counter1  Number := 1; 
     counter2  hr.jobs.job_title%TYPE; 
    
BEGIN 
/* write a query to retrieve job title and average salary for each job*/ 
/* use BULK COLLECT INTO to store the query results in the nested table*/ 
     
SELECT J.job_title, AVG(E.salary) 
BULK COLLECT INTO job_avg_sal_nested  
FROM hr.jobs J, hr.employees E 
WHERE J.job_id = E.JOB_ID 
GROUP BY J.job_title; 
 
 /* loop through the nested table and store each item in the assiciative array */   
   FOR counter1 IN  job_avg_sal_nested.FIRST ..  job_avg_sal_nested.LAST  
   LOOP 
   job_avg_sal(job_avg_sal_nested(counter1).job_title) := job_avg_sal_nested(counter1).job_avg ; 
   END LOOP; 
 
/* loop through the associative array and print the job_title and the average salary for each job*/ 
    counter2 := job_avg_sal.FIRST; -- First Element  
    -- Print Table Titles 
    dbms_output.put_line(RPAD( 'Title' , 35) || ' | ' || RPAD('Salary' ,15) ); 
    dbms_output.put_line( '----------------------------------------------------' ); 
     
    LOOP -- Print Job Title and Average Salary for Each Job in Separate Lines 
    dbms_output.put_line(RPAD( counter2 , 35) || ' | ' || RPAD(job_avg_sal(counter2) ,15) ); 
    counter2 := job_avg_sal.NEXT(counter2); 
    Exit when counter2 IS NULL; -- Loop Condition to Exist  
    END LOOP; 
END; 

/

