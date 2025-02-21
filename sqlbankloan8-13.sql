#8.Bad loan
select 
    round((count( case when loan_status = "Charged off" Then id END)*100),2)/
    COUNT(id) as good_loan_percentage
    from finance;
    
    select count(id) as bad_loan_applications from finance
    where loan_status = "Charged off";
    #9.
select sum(loan_amount) as bad_loan_funded_amt from finance
where loan_status = "charged off";

select sum(total_payment) as bad_loan_received_amt from finance
where loan_status = "charged off";
#loan status
select loan_status,
count(id) as total_loan_applications,
sum(total_payment) as total_amt_received,
sum(loan_amount) as total_funded_amt,
round(avg(int_rate * 100),2) as interest_rate,
round(avg(dti*100),2) as DTI
from finance
group by loan_status;
#10.
select loan_status,
sum(total_payment) as MTD_total_amt_received,
sum(loan_amount) as MTD_total_funded_amt
from finance 
where month(issue_date)=12
group by loan_status;
#11.
select
    month(issue_date) as month_number,
    monthname(issue_date) as month_name,
    count(id) as total_loan_applications,
    sum(loan_amount) as total_funded_amount,
    sum(total_payment) as total_received_amount
    from finance
    group by MONTH(issue_date), monthname(issue_date)
    order by month(issue_date) ;
    #12.
select
   address_state,
    count(id) as total_loan_applications,
    sum(loan_amount) as total_funded_amount,
    sum(total_payment) as total_received_amount
    from finance
    group by address_state
    order by sum(loan_amount) desc;
    
    #Loan term
    
    select
     term,
    count(id) as total_loan_applications,
    sum(loan_amount) as total_funded_amount,
    sum(total_payment) as total_received_amount
    from finance
    group by term
    order by sum(loan_amount) desc;
    #13.employee lane
select
   emp_length,
    count(id) as total_loan_applications,
    sum(loan_amount) as total_funded_amount,
    sum(total_payment) as total_received_amount
    from finance
    group by emp_length
    order by count(id) desc;
    
    #purpose
    select
    purpose,
    count(id) as total_loan_applications,
    sum(loan_amount) as total_funded_amount,
    sum(total_payment) as total_received_amount
    from finance
    group by purpose
    order by count(id) desc;
    #home ownership
    select
     home_ownership,
    count(id) as total_loan_applications,
    sum(loan_amount) as total_funded_amount,
    sum(total_payment) as total_received_amount
    from finance
    group by home_ownership
    order by count(id) desc;