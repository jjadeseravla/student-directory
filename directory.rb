@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process((STDIN.gets.chomp))
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def input_students
  answer = "y"
  #@students = []
  while answer == "y"
    puts "Hello.  You will be asked to enter the name and other information of a student"
    puts "To finish, just hit return twice"
  # get the first name
    puts "Enter the name of the student please"
    name = STDIN.gets.chomp
    name = "Student" if name.empty?
    cohort_month = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
    puts "Enter the cohort (month) of #{name}"
    cohort = STDIN.gets.chomp.downcase
      until cohort_month.include? (cohort)
        puts "Not recognised, please type in month of cohort again"
        cohort = STDIN.gets.chomp.downcase
      end
    puts "Enter one hobby of #{name}"
    hobby = STDIN.gets.chomp
    hobby = "Unknown" if hobby.empty?
    puts "Enter the student's height (cm) using numbers only"
    height = STDIN.gets.chomp
    height = "Unknown" if height.empty?
    puts "Enter the country of birth of #{name}"
    country_of_birth = STDIN.gets.chomp
    country_of_birth = :Unknown if country_of_birth.empty?
    # add the student hash to the array
    puts "Is the input for this student correct? (Type 'y' for yes or 'n' for no)"
    input = STDIN.gets.chomp
        if input == "y"
          @students << {name: name, cohort: cohort.to_sym, hobby: hobby, height: height, country_of_birth: country_of_birth}
          puts "Now we have #{@students.count} students"
    # get another name from the user
        puts "Input another student? (Type 'y' for yes or type 'n' for no)"
        answer = STDIN.gets.chomp
        end
      end
  # return the array of students
    #return @students
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
@students.each do |student|
  puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  if @students.count == 1
    puts "Overall, we have 1 great student"
  elsif @students.count >= 2
    puts "Overall, we have #{@students.count} great students"
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

# def print_by_cohort(students)
#   by_cohort = []
#   students.select do |hash|
#     if hash[:cohort] == :january
#       by_cohort << hash
#       end
#     end
#   return by_cohort
# end

# def print_directory(@students)
#   count = 1
#   line_width = 50
#     while count <= students.length
#       puts "#{count}: #{students[count-1][:name]}".center(line_width)
#       puts "#{@students[count-1][:cohort]}".center(line_width)
#       puts "#{@students[count-1][:hobby]}".center(line_width)
#       puts "#{@students[count-1][:height]}".center(line_width)
#       puts "#{@students[count-1][:country_of_birth]}".center(line_width)
#     count += 1
#   end
# end

#students = input_students
#print_header
#students = print_by_cohort(students)
#print_directory(students)
#specific_letter(students)
#print_footer(students)
try_load_students
interactive_menu
#load_students # will load from students.csv by default
#load_students(list.txt) # will load from list.txt
