def input_students(d_name = "N/A", d_cohort = :December)
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  puts "Please enter the name of the cohort"
  cohort = gets.chomp

  return 1 if name == ""
  
  cohort = d_cohort.to_sym if cohort == ""

  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort, country: :UK}
    if students.count > 1
      puts "Now we have #{students.count} students"
    else
      puts "Now we have #{students.count} student"
    end
    # get another name from the user
    name = gets.chomp
    cohort = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  if students == 1
    puts "No students"
    exit
  end

  sort_by_cohort = {}

  students.each do |student|
    cohort = student[:cohort]
    name = student[:name]

    if sort_by_cohort[cohort] == nil
      sort_by_cohort[cohort] = [name]
    else
      sort_by_cohort[cohort].push(name)
    end
  end
  sort_by_cohort.each do |key, value|
    values = value.join(", ")
    puts "#{key}: #{values}"
  end
   
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(70, "*")
end

def interactive_menu
  students = []

  loop do
  # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more items
  # 2. read the input and save it into a variable
    selection = gets.chomp
  # 3. do what the user has asked
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit # this will cause the program to terminate
      else
        puts "I dont't know what you meant, try again"
    end
  end
end

# nothing happens untill we call the methods
interactive_menu
