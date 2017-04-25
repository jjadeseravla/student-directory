
def input_students
  answer = "y"
  students = []
  while answer == "y" do
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  # get the first name
  puts "Enter your name"
  name = gets.chomp
  # while the name is not empty, repeat this code
  #while !name.empty? do
    puts "What hobbies do you like?"
    hobbies = gets.chomp
    puts "height in cm?"
    height = gets.chomp
    puts "country of birth?"
    country_of_birth = gets.chomp
    # add the student hash to the array
    while name.empty? || hobbies.empty? || height.empty? || country_of_birth.empty?
      puts "Inalid input"
      puts "Enter your name"
      name = gets.chomp
      puts "What hobbies do you like?"
      hobbies = gets.chomp
      puts "height in cm?"
      height = gets.chomp
      puts "country of birth?"
      country_of_birth = gets.chomp
    end
    students << {name: name, cohort: :november, hobbies: hobbies, height: height, country_of_birth: country_of_birth}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Input another student? type 'y' for yes or type 'n' for no"
    answer = gets.chomp
  end
  # return the array of students
  students
end

def print(students)
  count = 1
    while count <= students.length
    puts "#{count}: #{students[count-1][:name]} likes #{students[count-1][:hobbies]} and is #{students[count-1][:height]}cm.  Country of birth is #{students[count-1][:country_of_birth]} (#{students[count-1][:cohort]} cohort)"
    count += 1
  end
end

  def print_header
    puts "The students of Villains Academy"
    puts "-------------"
  end

  def print_footer(students)
  puts "Overall, we have #{students.count} great students"
  end


students = input_students
print_header
print(students)
#specific_letter(students)
print_footer(students)
