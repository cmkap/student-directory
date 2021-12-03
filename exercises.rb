def input_students
  puts "Please enter the name and country of birth of the students"
  puts "To finish, just hit return twice"
  # create an empty array
   students = []
  # get the first name
  name = gets.chomp
  country = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november, country: country}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
    country = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  count = 0
  until count == students.length
    puts "#{count + 1} #{students[count][:name]}, country of birth #{students[count][:country]} (#{students[count][:cohort]} cohort)".center(70, "*")
    count += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(70, "*")
end

students = input_students
# nothing happens untill we call the methods
print_header
print(students)
print_footer(students)
