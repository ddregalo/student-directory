def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts  "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def student_search(students)
  puts "Select letter to search students directory:"
  puts "** Note: write \"all\" to list all students"
  user_search = gets.chomp.downcase
  if user_search == "all"
    select_students = students
  else
    select_students = students.select { |student| student[:name].chars.first.downcase == user_search }
  end
  select_students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(select_students)
    select_students.each_with_index do |student, index|
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer(select_students)
  puts "Overall, we have #{select_students.count} great students"
end

students = input_students
select_students = student_search(students)
#nothing happens until we call the methods
print_header
print(select_students)
print_footer(select_students)
