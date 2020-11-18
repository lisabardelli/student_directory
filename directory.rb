def interactive_menu
  students = []
  loop do
    puts '1. Input the students'
    puts '2. Show the students'
    puts '9. Exit'
    selection = gets.chomp
    case selection
    when '1'
      students = input_students
    when '2'
      print_header(students)
      print(students)
      print_footer(students)
    when '9'
      exit
    else
      puts "I don't know what you meant, try again"
    end
  end
end

def print_header(students)
  if students.count > 0
    puts 'The students of Makers Academy'.center(60)
    puts '-------------'.center(60)
  else
    puts 'No students in the Makers Academy'
  end
end

def input_students
  students = []
  months = %w[january february march april may june july august september october november december]
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'
  name = gets.gsub("\n", '')

  until name.empty?
    puts 'Please enter his/her cohort'
    cohort = gets.gsub("\n", '')
    cohort = 'November' if cohort.empty?
    until months.include? cohort.chomp.downcase
      puts 'There must be a typo, please enter the cohort'
      cohort = gets
    end
    students << { name: name, cohort: cohort.chomp }
    if students.count < 2
      puts "Now we have #{students.count} student".center(60)
    else
      puts "Now we have #{students.count} students".center(60)
    end
    name = gets.chomp
  end
  students
end

def print(students)
  students_by_cohort = {}
  students.each do |student|
    cohort = student[:cohort]
    name = student[:name]

    if students_by_cohort[cohort].nil?
      students_by_cohort[cohort] = [name]
    else
      students_by_cohort[cohort].push(name)
    end
  end
  students_by_cohort.each do |key, value|
    if value.length > 1
      puts "The students #{value.join(', ')} are in the  #{key} cohort."
    else
      puts "The student #{value.join} is in the  #{key} cohort."
    end
  end
end

def print_footer(students)
  return if students.count < 1

  if students.count < 2
    puts "Overall, we have #{students.count} great student".center(60)
  else
    puts "Overall, we have #{students.count} great students".center(60)
  end
end

interactive_menu
