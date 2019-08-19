# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_title
  "select pr.title
    ,sum(pl.amount)
  
  from projects pr 
  join pledges pl on pr.id = pl.project_id
  
  where 1=1 
  
  group by title 
  order by title"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
  "select u.name
    , u.age
    , sum(p.amount)
    
  from pledges p 
  join users u on p.user_id = u.id
    
  where 1=1 
    
  group by 1
  order by 1"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
  "select pr.title
    , sum(pl.amount) - pr.funding_goal as difference 
    
  from projects pr 
  join pledges pl on pl.project_id = pr.id 
  
  group by 1
  
  having difference >= 0"
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_summed_amount
  "select u.name 
    , sum(p.amount)
    
  from users u 
  join pledges p on p.user_id = u.id
  
  where 1=1 
  
  group by 1 
  order by 2"
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
  "select pr.category 
    , pl.amount 
    
  from projects pr 
  join pledges pl on pl.project_id = pr.id
  
  where pr.category = 'music'"
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
  "select pr.category 
    , sum(pl.amount) 
    
  from projects pr 
  join pledges pl on pl.project_id = pr.id
  
  where pr.category = 'books'
  
  group by 1"
end
