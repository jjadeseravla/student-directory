#Right now if we have only one student, the user will see a message "Now we have 1 students",
#whereas it should be "Now we have 1 student".
#How can you fix it so that it used singular form when appropriate and plural form otherwise?
def input_students
  answer = "y"
  students = []
  while answer == "y"
    puts "Hello.  You will be asked to enter the name and other information of a student"
    puts "To finish, just hit return twice"
  # get the first name
    puts "Enter the name of the student please"
    name = gets.chomp
    name = "Student" if name.empty?
    cohort_month = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
    puts "Enter the cohort (month) of #{name}"
    cohort = gets.chomp.downcase
      until cohort_month.include? (cohort)
        puts "Not recognised, please type in month of cohort again"
        cohort = gets.chomp.downcase
      end
    puts "Enter one hobby of #{name}"
    hobby = gets.chomp
    hobby = "Unknown" if hobby.empty?
    puts "Enter the student's height (cm) using numbers only"
    height = gets.chomp
    height = "Unknown" if height.empty?
    puts "Enter the country of birth of #{name}"
    country_of_birth = gets.chomp
    country_of_birth = :Unknown if country_of_birth.empty?
    # add the student hash to the array
    puts "Is the input for this student correct? (Type 'y' for yes or 'n' for no)"
    input = gets.chomp
        if input == "y"
          students << {name: name, cohort: cohort.to_sym, hobby: hobby, height: height, country_of_birth: country_of_birth}
          puts "Now we have #{students.count} students"
    # get another name from the user
        puts "Input another student? (Type 'y' for yes or type 'n' for no)"
        answer = gets.chomp
        end
      end
  # return the array of students
    return students
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

def print_directory(students)
  count = 1
  line_width = 50
    while count <= students.length
      puts "#{count}: #{students[count-1][:name]}".center(line_width)
      puts "#{students[count-1][:cohort]}".center(line_width)
      puts "#{students[count-1][:hobby]}".center(line_width)
      puts "#{students[count-1][:height]}".center(line_width)
      puts "#{students[count-1][:country_of_birth]}".center(line_width)
    count += 1
  end
end

  def print_header
    puts "The students of Villains Academy"
    puts "-------------"
  end

def print_footer(students)
  if students.count == 1
    puts "Overall, we have 1 great student"
  elsif students.count >= 2
    puts "Overall, we have #{students.count} great students"
  end
end


students = input_students
print_header
#students = print_by_cohort(students)
print_directory(students)
#specific_letter(students)
print_footer(students)
