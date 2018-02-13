def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #get the cohort
  puts "What cohort is the student in"
  cohort = gets.chomp.strip.downcase.to_sym
  cohort_groups = [
    :january,
    :february,
    :march,
    :april,
    :may,
    :june,
    :july,
    :august,
    :september,
    :october,
    :november,
    :december
  ]
  while true do
    if cohort == ""
      cohort = "december".to_sym
    elsif cohort_groups.include?(cohort)
      break
    else
      puts "Re-enter cohort"
      cohort = gets.chomp.strip.downcase.to_sym
    end
  end
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort}
    puts  "Now we have #{students.count} students"
    # get another name from the user
    puts "Next student name"
    name = gets.chomp
    break if name == ""
    puts "What cohort is the student in"
    cohort = gets.chomp.strip.downcase.to_sym
    while true do
      if cohort == ""
        cohort = "december".to_sym
      elsif cohort_groups.include?(cohort)
        break
      else
        puts "Re-enter cohort"
        cohort = gets.chomp.strip.downcase.to_sym
      end
    end
  end
  # return the array of students
  students
end

def group_cohorts(students)
  puts "What cohort would you like to print?"
  user_cohort = gets.chomp.strip.downcase.to_sym
  students.select do |student|
    student[:cohort] == user_cohort
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort].capitalize} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
students = input_students
selected_cohorts = group_cohorts(students)
#nothing happens until we call the methods
print_header
print(selected_cohorts)
print_footer(students)
