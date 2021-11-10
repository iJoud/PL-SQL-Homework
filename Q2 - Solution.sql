
DECLARE

CURSOR TOP_NATION_CURSOR IS 
    SELECT OLYM.OLYM_MEDALS_VIEW.SPORT, OLYM.OLYM_MEDALS_VIEW.NOC, COUNT(OLYM.OLYM_MEDALS_VIEW.MEDAL)
    FROM OLYM.OLYM_MEDALS_VIEW
    WHERE OLYM.OLYM_MEDALS_VIEW.MEDAL = 'Gold'
    GROUP BY OLYM.OLYM_MEDALS_VIEW.SPORT, OLYM.OLYM_MEDALS_VIEW.NOC
    ORDER BY COUNT(OLYM.OLYM_MEDALS_VIEW.MEDAL) DESC, OLYM.OLYM_MEDALS_VIEW.SPORT DESC; 


PROCEDURE  TOP_NATIONS_PROCEDURE ( sport_ IN OLYM.OLYM_MEDALS_VIEW.SPORT%TYPE, size_ IN NUMBER ) IS 
    sport  OLYM.OLYM_MEDALS_VIEW.SPORT%TYPE;
    nation OLYM.OLYM_MEDALS_VIEW.NOC%TYPE;
    total_medal   NUMBER;
    Rank NUMBER;

    BEGIN
    Rank := 1;
    OPEN TOP_NATION_CURSOR;
    
     LOOP 
        FETCH TOP_NATION_CURSOR INTO sport , nation , total_medal ;
        EXIT WHEN TOP_NATION_CURSOR%notfound;
        IF sport_ = sport THEN 
        DBMS_OUTPUT.PUT_LINE(RPAD(sport ,11) || '| ' || RPAD(Rank ,5) || '| ' || RPAD(nation ,7) || '| ' || total_medal );
        Rank := Rank +1;
        EXIT WHEN Rank > size_;
        END IF;
     END LOOP; 
     
    CLOSE TOP_NATION_CURSOR;
    
dbms_output.put_line('-------------------------------------------');
END;

BEGIN
DBMS_OUTPUT.put_line('-------------------------------------------');
DBMS_OUTPUT.put_line(RPAD('SPORT',10) || ' | RANK | NATION | Gold Medals');
DBMS_OUTPUT.put_line('-------------------------------------------');

TOP_NATIONS_PROCEDURE('Aquatics', 3);
TOP_NATIONS_PROCEDURE('Basketball', 4);
TOP_NATIONS_PROCEDURE('Sailing', 2);
TOP_NATIONS_PROCEDURE('Taekwondo', 3);
END;

/

