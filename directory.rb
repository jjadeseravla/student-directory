@students = []

def input_students
  answer = "y"
  #@students = []
  while answer == "y"
    puts "Hello.  You will be asked to enter the name and other information of a student"
    puts "To finish, just hit return twice"
  # get the first name
    puts "Enter the name of the student please"
    name = gets.strip
    name = "Student" if name.empty?
    cohort_month = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
    puts "Enter the cohort (month) of #{name}"
    cohort = gets.strip.downcase
      until cohort_month.include? (cohort)
        puts "Not recognised, please type in month of cohort again"
        cohort = gets.strip.downcase
      end
    puts "Enter one hobby of #{name}"
    hobby = gets.strip
    hobby = "Unknown" if hobby.empty?
    puts "Enter the student's height (cm) using numbers only"
    height = gets.strip
    height = "Unknown" if height.empty?
    puts "Enter the country of birth of #{name}"
    country_of_birth = gets.strip
    country_of_birth = :Unknown if country_of_birth.empty?
    # add the student hash to the array
    puts "Is the input for this student correct? (Type 'y' for yes or 'n' for no)"
    input = gets.strip
        if input == "y"
          @students << {name: name, cohort: cohort.to_sym, hobby: hobby, height: height, country_of_birth: country_of_birth}
          puts "Now we have #{@students.count} students"
    # get another name from the user
        puts "Input another student? (Type 'y' for yes or type 'n' for no)"
        answer = gets.strip
        end
      end
  # return the array of students
    #return @students
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
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
  elsif students.count >= 2
    puts "Overall, we have #{@students.count} great students"
  end
end

#students = input_students
#print_header
#students = print_by_cohort(students)
#print_directory(students)
#specific_letter(students)
#print_footer(students)
interactive_menu
