system "clear"

@students = []
@filename = ""

def add_student(name)
  #add a student to the @students array
  @students << {name: name, cohort: :november}
end

def get_student
  puts "Please enter a student name"
  puts "To finish, just hit return twice"
  #get the first name
  name = STDIN.gets.chomp
  return name
end

def input_students  #asks user for students names on loop until user escapes
  name = get_student
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    add_student(name)
    puts "Student successfully added"
    puts  "Now we have #{@students.count} students"
    `say welcome #{name}`
    # get another name from the user
    name = get_student
  end
  # return the array of students
  @students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def print_menu
  system "clear"
  puts "\n\n"
  puts "STUDENTS DIRECTORY MENU\n\n" 
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list of students.csv"
  puts "9. Exit \n\n" # 9 because we'll be adding more items
end

def show_students
  #prints student list to screen
  system "clear"
  if @students.count >= 1
    puts ""
    puts "Press Enter to go back to menu"
    puts ""
    print_header
    print_students_list
    print_footer
    gets
  else
    puts "There are no students"
    timer
  end
end

def process(selection)
  case selection
    when "1"
      # input the students
      @students = input_students
    when "2"
      # show the students
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      puts "Goodbye"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end

def save_students
  #ask user to input filename to save then saves to file
  #if nothing entered saves to default @filename
  puts "Select file name to save to (press Enter to save to default \"#{@filename}\")"
  save_input = STDIN.gets.chomp.length
  if save_input > 0
    @filename == save_input
  end
  #open the file for writing
  file = File.open(@filename, "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Student list saved successfully"
  timer
end

def load_students
  #ask user which filename to load
  #opens the file and reads file
  puts "What student file do you want to load?"
  @filename = STDIN.gets.chomp
  #open the file for reading
  file = File.open(@filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    add_student(name)
  end
  file.close
  puts "#{@filename} has loaded successfully"
  timer
end

def autoload_students
  #opens current @filename when program opens
  file = File.open(@filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    add_student(name)
  end
  file.close
end

def try_load_students
  #check if any ARGV has been set - if yes, set to @filename - if no, set @filename = students.csv
  if ARGV.first.nil?
    @filename = "students.csv"
  else #if file has been passed check if file exists and if yes it opens file
    @filename = ARGV.first #first argument from the command line
  end
  if File.exists?(@filename) #check if file exists
    autoload_students
    puts "Loaded #{@students.count} from #{@filename}"
  else #if it doesn't exist
    puts "Tried to load #{@filename} unsuccessfully."
  end
  timer
end

def timer
  count = 1
  puts "Please wait..."
  until count == 5
    print "#{count}  "
    count += 1
    sleep 1 
  end
  system "clear"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu
