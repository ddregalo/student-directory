def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  puts "What is your country of birth"
  country = gets.chomp
  puts "What is your height in cms"
  height = gets.chomp
  puts "What is your favourite hobby"
  hobby = gets.chomp
  # while the name is not empty, repeat this code
  while name do
    # add the student hash to the array
    students << {name: name, cohort: :november, country: country, height: height, hobby: hobby}
    puts  "Now we have #{students.count} students"
    # get another name from the user
    puts "Enter another name"
    name = gets.chomp
    break if name == ""
    puts "What is your country of birth"
    country = gets.chomp
    puts "What is your height in cms"
    height = gets.chomp
    puts "What is your favourite hobby"
    hobby = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    puts "Born in #{student[:country]}"
    puts "Height: #{student[:height]} cm"
    puts "Favourite Hobby: #{student[:hobby]}"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
