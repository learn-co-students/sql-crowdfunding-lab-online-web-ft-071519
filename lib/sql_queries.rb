# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_title
  # I need to show project.title and the pledge amounts from Projects
  # I need to sum the pledge.amount and group by project_id
  "SELECT projects.title, SUM(pledges.amount) AS pledge_amount FROM projects
JOIN pledges
ON projects.id = pledges.project_id
GROUP BY pledges.project_id
ORDER BY projects.title;"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
  # I need the user.name, user.age, and the pledge amount from Users
  # I need to sum the pledge.amount and group by user_id
  # I need to order by user.name
  "SELECT users.name, users.age, SUM(pledges.amount) AS pledged_amount
FROM users
JOIN pledges
ON users.id = pledges.user_id
GROUP BY pledges.user_id
ORDER BY users.name;"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
  # I need the projects.title and SUM(pledges.amount - projects.funding_goal)
  # where projects.funding_goal <= pledges.amount from Projects
  "SELECT projects.title, SUM(pledges.amount) - projects.funding_goal AS extra
FROM projects
JOIN pledges
ON projects.id = pledges.project_id
GROUP BY pledges.project_id
HAVING extra >= 0"
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_summed_amount
  # I need the user.name and SUM(pledges.amount) as summed_amount FROM users
  # grouped by user.name
  # order by summed_amount
  "SELECT users.name, SUM(pledges.amount) AS summed_amount
FROM users
JOIN pledges
ON users.id = pledges.user_id
GROUP BY users.name
ORDER BY summed_amount;"
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
  # I need the projects.category and the sum of the category pledge from projects
  "SELECT projects.category, pledges.amount AS pledged_amount
FROM projects
JOIN pledges
ON projects.id = pledges.project_id
WHERE projects.category = 'music'"
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
  # I need the project.category and SUM(pledges.amount) from projects
  # where projects.category = 'books'
  "SELECT projects.category, SUM(pledges.amount) AS pledged_amount
FROM projects
JOIN pledges
ON projects.id = pledges.project_id
WHERE projects.category = 'books';"
end
