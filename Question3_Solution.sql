
DECLARE 
    -- PL SQL code to create and fill a two-dimensional array 
    -- create VARRAY type of 10 integers 
    TYPE array_10_int  IS VARRAY(10) of PLS_INTEGER; 
    -- create VARRAY type of array_10_int  
    TYPE grid_100_int IS VARRAY(10) of array_10_int; 
        -- declare a variable of the grid_100_int type 
    grid_var grid_100_int; 
    -- declare counters  
    i PLS_INTEGER := 0; 
    j PLS_INTEGER ; 
    Value number := 1; -- Declare Variable to Assign Values in the Array 
BEGIN 
    grid_var := grid_100_int(); 
    -- TO DO : use nested loop to fill grid_var with numbers 1- 100 
    /** YOUR CODE HERE **/ 
    grid_var.extend(10); -- Extend Varray for 10 Elements     
    LOOP --outer loop   
        i := i+1; 
        j := 1; 
        grid_var(i) := array_10_int(); -- Row i  
        grid_var(i).extend(10); -- Extend Row i for 10 Elements 
             LOOP -- inner loop 
                grid_var(i)(j) := Value; -- Assigning value 
                Value:= Value+1; -- Increment Value for Next Element 
                j:= j+1; 
            EXIT WHEN (j >10); 
            END LOOP; 
             
        EXIT WHEN (i =10); 
        END LOOP; 
-- Print the grid with nested loop 
    i :=0; 
    LOOP --outer loop 
        i := i+1; 
        j := 0; 
        LOOP    -- inner loop 
            j:= j+1; 
            IF grid_var(i)(j) < 10 THEN 
                DBMS_OUTPUT.PUT(' ' || grid_var(i)(j) || ' '); 
            ELSE 
                DBMS_OUTPUT.PUT( grid_var(i)(j) || ' '); 
            END IF; 
            
            EXIT WHEN (j =10); 
        END LOOP; 
        dbms_output.put_line(' '); 
        EXIT WHEN (i =10); 
    END LOOP;     
END; 

/

