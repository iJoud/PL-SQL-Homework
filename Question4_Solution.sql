
DECLARE 

    -- Cursor declaration
    CURSOR bestAthlete_cursor IS 
    SELECT ATHLETE, GENDER, SPORT, NOC,
    COUNT(CASE 
          WHEN MEDAL = 'Gold' 
          THEN 1 ELSE NULL END) AS Gold,
    COUNT(CASE 
          WHEN MEDAL = 'Silver' 
          THEN 1 ELSE NULL END) AS Silver,
    COUNT(CASE 
          WHEN MEDAL = 'Bronze' 
          THEN 1 ELSE NULL END) AS Bronze
    FROM OLYM.OLYM_MEDALS_VIEW
    GROUP BY ATHLETE, GENDER, SPORT, NOC
    ORDER BY ATHLETE;
	
    -- #1 Procedure(Sport, Gender) declaration
    PROCEDURE bestAthletes_proc (v_sport IN OLYM.OLYM_MEDALS_VIEW.SPORT%TYPE,
                                 v_gender IN OLYM.OLYM_MEDALS_VIEW.GENDER%TYPE)
     IS 
         Sport_ OLYM.OLYM_MEDALS_VIEW.SPORT%TYPE;
         Athlete_ OLYM.OLYM_MEDALS_VIEW.ATHLETE%TYPE;
         NOC_ OLYM.OLYM_MEDALS_VIEW.NOC%TYPE;
         Gender_ OLYM.OLYM_MEDALS_VIEW.GENDER%TYPE;
    	 won_Medal_ NUMBER := 0;
    	 gold_Medals_ NUMBER;
         silver_Medals_ NUMBER;
         bronze_Medals_ NUMBER;
        BEGIN
            OPEN bestAthlete_cursor;
            LOOP 
            FETCH bestAthlete_cursor INTO Athlete_, Gender_, Sport_, NOC_, gold_Medals_, silver_Medals_, bronze_Medals_;
            EXIT WHEN bestAthlete_cursor%NOTFOUND; 

            won_Medal_ := gold_Medals_ + silver_Medals_ + bronze_Medals_;
      
            IF won_Medal_ > 5 
            THEN
                IF Gender_ = v_gender and Sport_ = v_sport 
                THEN
                    dbms_output.put_lINe(RPAD(' | ' || Athlete_ , 38) || '|   ' ||  gold_Medals_ || '  |   ' ||  silver_Medals_ || '    |   ' ||  bronze_Medals_  ||  RPAD('    |   ' || won_Medal_, 12) || '|');
                END IF;
            END IF;
			
			won_Medal_ := 0;

            END LOOP;
            
            CLOSE bestAthlete_cursor;
            
        END;
        

    -- #2 Procedure (Nation) declaration
    PROCEDURE bestAthletes_proc (v_NOC IN OLYM.OLYM_MEDALS_VIEW.NOC%TYPE)
     IS 
         Sport_ OLYM.OLYM_MEDALS_VIEW.SPORT%TYPE;
         Athlete_ OLYM.OLYM_MEDALS_VIEW.ATHLETE%TYPE;
         NOC_ OLYM.OLYM_MEDALS_VIEW.NOC%TYPE;
         Gender_ OLYM.OLYM_MEDALS_VIEW.GENDER%TYPE;
    	 won_Medal_ NUMBER := 0;
    	 gold_Medals_ NUMBER;
         silver_Medals_ NUMBER;
         bronze_Medals_ NUMBER;
        BEGIN
            OPEN bestAthlete_cursor;
            LOOP 
            FETCH bestAthlete_cursor INTO Athlete_, Gender_, Sport_, NOC_, gold_Medals_, silver_Medals_, bronze_Medals_;
            EXIT WHEN bestAthlete_cursor%NOTFOUND; 

            won_Medal_ := gold_Medals_ + silver_Medals_ + bronze_Medals_;
      
            IF won_Medal_ > 5 
            THEN
                IF NOC_ = v_NOC
                THEN
                    dbms_output.put_lINe(RPAD(' | ' || Athlete_ , 38) || '|   ' ||  gold_Medals_ || '  |   ' ||  silver_Medals_ || '    |   ' ||  bronze_Medals_  ||  RPAD('    |   ' || won_Medal_, 12) || '|');
                END IF;
            END IF;

            won_Medal_ := 0;

            END LOOP;
            
            CLOSE bestAthlete_cursor;
            
        END;
    

    -- #3 Procedure (Sport) declaration
    PROCEDURE bestAthletes_proc (v_sport IN OLYM.OLYM_MEDALS_VIEW.SPORT%TYPE)
     IS 
         Sport_ OLYM.OLYM_MEDALS_VIEW.SPORT%TYPE;
         Athlete_ OLYM.OLYM_MEDALS_VIEW.ATHLETE%TYPE;
         NOC_ OLYM.OLYM_MEDALS_VIEW.NOC%TYPE;
         Gender_ OLYM.OLYM_MEDALS_VIEW.GENDER%TYPE;
    	 won_Medal_ NUMBER := 0;
    	 gold_Medals_ NUMBER;
         silver_Medals_ NUMBER;
         bronze_Medals_ NUMBER;
        BEGIN
            OPEN bestAthlete_cursor;
            LOOP 
            FETCH bestAthlete_cursor INTO Athlete_, Gender_, Sport_, NOC_, gold_Medals_, silver_Medals_, bronze_Medals_;
            EXIT WHEN bestAthlete_cursor%NOTFOUND; 

            won_Medal_ := gold_Medals_ + silver_Medals_ + bronze_Medals_;
      
            IF won_Medal_ > 5 
            THEN
                IF Sport_ = v_sport
                 THEN
                    dbms_output.put_lINe(RPAD(' | ' || Athlete_ , 38) || '|   ' ||  gold_Medals_ || '  |   ' ||  silver_Medals_ || '    |   ' ||  bronze_Medals_  ||  RPAD('    |   ' || won_Medal_, 12) || '|');
                END IF;
            END IF;
			
			won_Medal_ := 0;

            END LOOP;
            
            CLOSE bestAthlete_cursor;
            
        END;


    
BEGIN


dbms_output.put_line('Women in Aquatics');
dbms_output.put_line(rpad(' -', 72, '-'));
dbms_output.put_line(' | ' || RPAD('Athlete', 35) || '| Gold | Silver | Bronze | Total |');
dbms_output.put_line(rpad(' -', 72, '-'));
bestAthletes_proc(v_sport => 'Aquatics', v_gender => 'Women');
dbms_output.put_lINe('.');
dbms_output.put_lINe('.');
dbms_output.put_line('Australian athletes');
dbms_output.put_line(rpad(' -', 72, '-'));
dbms_output.put_line(' | ' || RPAD('Athlete', 35) || '| Gold | Silver | Bronze | Total |');
dbms_output.put_line(rpad(' -', 72, '-'));
bestAthletes_proc(v_NOC => 'AUS');
dbms_output.put_lINe('.');
dbms_output.put_lINe('.');
dbms_output.put_line('Gymnastics athletes');
dbms_output.put_line(rpad(' -', 72, '-'));
dbms_output.put_line(' | ' || RPAD('Athlete', 35) || '| Gold | Silver | Bronze | Total |');
dbms_output.put_line(rpad(' -', 72, '-'));
bestAthletes_proc(v_sport => 'Gymnastics');


END; 

