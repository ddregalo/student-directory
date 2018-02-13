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

def print_header
  puts "The students of Villains Academy with names smaller than 12 characters"
  puts "-------------"
end

def student_count(students)
  students.select { |student| student[:name].length < 12}.count
end

def print(students)
  students.each_with_index do |student, index|
    if student[:name].length < 12
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students} great students"
end
students = input_students
student_count = student_count(students)
#nothing happens until we call the methods
print_header
print(students)
print_footer(student_count)
