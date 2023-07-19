# HR Database Analysis

Hi everyone, who is reading this 👋

This is my Data Analyst’s portfolio project, that is aimed to demonstrate my SQL and Visualisation skills.

Environment used in this project:

1. MySQL Workbench & MySQL Server;
2. IBM Cognos Analytics.

# Introduction

**Data:**

The database used in this set is taken from the «Real World Fake Data» dataset. They provide convenient datasets that are perfect for practice being both easy to understand and challenging to clean.

For now I chose the HR database that contains information about current and former employees of a fictional company.

**Project goals:**

1. Create the table and input data into it;
2. Clean the data;
3. Do data manipulation to answer the project questions;
4. Visualise the key findings in a specialised environment.

**Project questions:**

1.	How many people currently work in the company?
2.	What is the average age of employees?
3.	What is the gender disproportion?
4.	Where are the employees located?
5.	What proportion of employees works remotely?
6.	What is the racial distribution in the company?
7.	What is the average length of service of employees?

# Interaction with data

**Table creation**

First of all, let’s create a new database and begin working with it.

<img width="1200" alt="image" src="https://github.com/Savelyev-Ilya/HR_Database_Analysis/assets/66965398/bf67d694-723f-46a5-b715-2bc2e8077911">

Now, I will create a table and define its columns according to the dataset in the .csv file.

<img width="1200" alt="image" src="https://github.com/Savelyev-Ilya/HR_Database_Analysis/assets/66965398/3cb34e61-b359-4ca2-ad47-722ac8e36167">

Finally, I am using “Table data import wizard” to conveniently import data to the table rather that copy-pasting it manually in the workbench.

After everything is done, let’s check that the data was imported successfully by visualising first five rows of table.

<img width="1200" alt="image" src="https://github.com/Savelyev-Ilya/HR_Database_Analysis/assets/66965398/e78a67a5-adb5-410f-a260-cbf5984f6fe6">

**Data cleaning**

After the table was created, I can move forward to preparing data for manipulation.

The first thing that has to be done is to transform the «birthdate», «hire_date» and «termdate» columns into the required format.

I write the code presented below to:

1.	Let the workbench make unsafe updates (I need it, because I am going to make an update without where clause for key column);
2.	Update the column with str_to_date function;
3.	Forbid making unsafe updates in the end;
4.	Make sure that data was converted successfully.

   <img width="1200" alt="image" src="https://github.com/Savelyev-Ilya/HR_Database_Analysis/assets/66965398/241271ec-74af-435a-8637-bbf3cb33dde9">

Great! It seems like this particular database doesn’t require other cleaning procedures and I can now move to data manipulation 🤩

**Answering the questions**

First of all, I would like to find all the distinct values of categorical variables, which the table mostly consists of. This can give me a better understanding of each column and may help me in future asking of additional questions.

<img width="1200" alt="image" src="https://github.com/Savelyev-Ilya/HR_Database_Analysis/assets/66965398/186eb6e9-6931-469c-afda-d971d3a30713">

Now, I begin answering the questions that I listed at the beginning of this project.


**1.	How many people currently work in the company?**

To be able to count the actual number of employees I first need to define who still works there and who has already resigned. To do this, I will make a new column named «currently_hired», which will compare the actual date with the date in the «termdate» column and if the termdate has already passed, the value will be «False».

<img width="1200" alt="image" src="https://github.com/Savelyev-Ilya/HR_Database_Analysis/assets/66965398/f0a18d55-7023-4b01-bfa7-fb178169089b">

Now we can count the current staff size simply using ‘where’ clause.

<img width="1200" alt="image" src="https://github.com/Savelyev-Ilya/HR_Database_Analysis/assets/66965398/0c972bcc-3ff4-4108-8c1e-f45b0ade4b87">

MySQL tells me that the result is 19762. I also want to see how many people work in each of the departments, so I will add a «group by» clause in the end of the previous command. I will also use «order by» clause to call the list in descending order.

<img width="1200" alt="image" src="https://github.com/Savelyev-Ilya/HR_Database_Analysis/assets/66965398/85ea7cf7-34a3-40f8-85be-52a59e8dfd43">

<img width="1200" alt="image" src="https://github.com/Savelyev-Ilya/HR_Database_Analysis/assets/66965398/b237143a-1157-4973-969e-96b8771219d5">


**2.	What is the average age of employees?**

Let’s create new column that will contain age values of employees.

<img width="1200" alt="image" src="https://github.com/Savelyev-Ilya/HR_Database_Analysis/assets/66965398/48206147-40c8-441b-8336-3b7fc7d26aaa">

Now, nothing prevents me from calculating the average age in the company, as well as in every of its departments. The difference will only be in «group by» and «order by» clauses similar to the previous question.

For the purpose of not making this project to long, I will not attach nearly same scripts here. You will be able to look through all the code in the HR.sql file! Here are the results.

<img width="1200" alt="image" src="https://github.com/Savelyev-Ilya/HR_Database_Analysis/assets/66965398/097fa461-6504-4f31-bcfe-b5fa863d87c7">

<img width="1200" alt="image" src="https://github.com/Savelyev-Ilya/HR_Database_Analysis/assets/66965398/93873568-6536-4bc5-93e0-c2e4f25236cc">


**3.	What is the gender disproportion?**

To find the gender disproportion I don’t need to create new columns. I will just make the following calculation to see the list of genders, number of employees of each gender and their percentage.

<img width="1200" alt="image" src="https://github.com/Savelyev-Ilya/HR_Database_Analysis/assets/66965398/4ddecf8b-74eb-4ab2-8c3a-aa731e1d3335">

<img width="1200" alt="image" src="https://github.com/Savelyev-Ilya/HR_Database_Analysis/assets/66965398/25839ebe-f304-4a93-9cea-6dbf022fc1d5">


**4.	Where are the employees located?**

To define the location of the staff I can calculate either their state or city. Here I will do both of them but post only the distribution by states to reduce space.

<img width="1200" alt="image" src="https://github.com/Savelyev-Ilya/HR_Database_Analysis/assets/66965398/2538bfe0-6272-47c8-9d77-98f03d24156b">

<img width="1200" alt="image" src="https://github.com/Savelyev-Ilya/HR_Database_Analysis/assets/66965398/e375d8cd-b4fa-4053-9be4-7121c7c873b5">

<img width="1200" alt="image" src="https://github.com/Savelyev-Ilya/HR_Database_Analysis/assets/66965398/50977ac8-f6cf-483d-9d5c-9e80e38dd9a3">


**5.	What proportion of employees works remotely?**

To find the proportion of remote employees I need to use a sub-query in the «select» statement as well as «where» clause with «and» to join two strict conditions together.

It seems like almost one-quarter of the staff doesn’t have to get to headquarters to do their work duties, which is a rather high percentage for such a relatively big company.

<img width="1200" alt="image" src="https://github.com/Savelyev-Ilya/HR_Database_Analysis/assets/66965398/74ec75bc-9ccf-4481-aeb2-06a175b5fe70">

<img width="1200" alt="image" src="https://github.com/Savelyev-Ilya/HR_Database_Analysis/assets/66965398/ad586c08-8073-4e9d-914c-27b2a5c292d1">


**6.	What is the racial distribution in the company?**

To conduct this calculation, I need to repeat the code from the previous questions and just make some minor alterations, depending on the type of column. I will also use an «order by» clause to put the results in descending order.

<img width="1200" alt="image" src="https://github.com/Savelyev-Ilya/HR_Database_Analysis/assets/66965398/b7fecd1c-c4b9-4f43-8a67-0dcf88f0845f">

<img width="1200" alt="image" src="https://github.com/Savelyev-Ilya/HR_Database_Analysis/assets/66965398/0766cbd0-6c8c-48e5-bec5-d64559eee7d1">

As it can be clearly seen, the company is well-diversified in terms of employees’ races. Even though the number of white people in the organisation is the highest one, their share is less that 30%, while there are a lot of other races and each of them is represented by more than a thousand of workers.


**7.	What is the average length of service of employees?**

For this calculation I will have to create a new column again, as it was with «currently_hired» and «age». The principle is similar to the last one: I will find the difference between the hire date and date of the termination. However, this task is a bit trickier, because there are people, who have already left the company and those, who a still working there, thus, the calculations of the service duration should vary.

I will again need a «case when» statement with a «timestampdiff» function that will compare the current date with the date of the termination and will run two different calculations for the new column depending on the result.

<img width="1200" alt="image" src="https://github.com/Savelyev-Ilya/HR_Database_Analysis/assets/66965398/37426992-9cda-4539-b2ab-1d7666f3fe35">

<img width="1200" alt="image" src="https://github.com/Savelyev-Ilya/HR_Database_Analysis/assets/66965398/2e248d45-3aa0-4cb4-8d51-f686c36a766c">

Great! Now, it’s a matter of a couple of rows to calculate the average length of service at the company.

<img width="1200" alt="image" src="https://github.com/Savelyev-Ilya/HR_Database_Analysis/assets/66965398/90754851-72e3-4f1b-863c-8d3b84a4a929">

<img width="1200" alt="image" src="https://github.com/Savelyev-Ilya/HR_Database_Analysis/assets/66965398/45d3166c-a637-4a09-bcb0-d948d86d0834">

<img width="1200" alt="image" src="https://github.com/Savelyev-Ilya/HR_Database_Analysis/assets/66965398/2ca57381-ede9-4989-ae35-278a13c5ce20">

As I see, the average length of service is rather constant among most of the departments, varying from 11.3 to 11.5 years, with only two significant outliers on both edges for auditing (12.0 years) and legal (10.8 years) departments respectively.

So, it seems like I have answered all the questions that were asked at the beginning of work. Great job so far! Now, let’s visualise the findings using IBM Cognos Analytics and see, what final conclusions can be made.


# Visualisation

So, here’s what I have after the visualisation is completed!

<img width="1200" alt="image" src="https://github.com/Savelyev-Ilya/HR_Database_Analysis/assets/66965398/48ca3afb-936a-4159-aa79-6517e6eda026">

You can try it by yourself by the link below and research it more precisely. https://eu2.ca.analytics.ibm.com/bi/?perspective=dashboard&pathRef=.my_folders%2FHR%2Bdashboard&action=view&mode=dashboard&subView=model000001896d651454_00000000

Now I will move to conclusions.


# Conclusion

The results of the survey indicate that the presented company has a relatively big size of almost 20 thousand current employees with the average age of 38.7. The staff is well-distributed racially and almost one-quarter of employees works remotely from various locations across the US. Just over a half of the company members are males, while around 49% of staff is represented by females and non-conforming. The average length of service at the organisation is more that 11 years, which means that people tend to work there for a significant period of time, rather than switching to the other place.

All these findings make it possible to think that this company is following all of the modern trends in employment sphere, being inclusive, diversified and remote work friendly. Moreover, it seems that the company treats its employees well and stimulates them to stay, as the average length of service is relatively high.


# Summary

During this project I mastered my SQL knowledge as well as Data Visualisation skills. I enjoyed working with data and writing a report. I would appreciate very much if you give me a feedback about my work with advice how to alter my future projects.

Thank you very much! See you in the next post!
