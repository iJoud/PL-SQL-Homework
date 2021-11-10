Course: DATABASE II 

The two files contain answers of the following questions
**Note: All schemas used is available online in LIVE SQL

# Question 1 : 
- Retrieve the department name and average salary from the tables DEPARTMENT and EMPLOYEE by calculating the average salary of all employees grouped in a department.
- store the result in a nested table using the BULK COLLECT INTO
- loop through the nested table and store the elements in an associative array where the key is the department name and the value is the average salary.
- loop through the associative array to print each department name with the average salary.
- use the example in slide 16 and the comments to help you.
- use the PL SQL function RPAD(string,length) to make you output clean and tidy.

# Question 2 : 
Part1:
- declare cursor TOP_NATION_CURSOR that accept parameter sport_
- for each nation that ever won a gold medal in the passed sport,
- the cursor retrieves the nation and the number of times it won a gold medal
- the query result should be ordered by the number of golden medals won
--------------------------------------------------------------------------------
Part2:
- declare procedure TOP_NATIONS_PROCEDURE that accept parameters sport_ and size_
- the procedure executes TOP_NATION_CURSOR with parameter sport_ and fetches the top size_
- nations that won the gold medal in the sport 
- for each nation of the top size_, this procedure will print the sport name, 
- the rank of nation, the nation name and the number of times it won the gold medal in sport_

# Question 3 : 
The code creates a two-dimensional 10*10 array using VARRAY. You need to complete the code to fill the array with the integers 1 to 100. Use the provided code that prints the array as a guide. 


