def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  students=[]
  name=gets.chomp
  puts "Please enter the hobby of the student"
  hobby=gets.chomp
  puts "Please enter the student's country of birth"
  country=gets.chomp
  puts "Please enter the student's country of height"
  height=gets.chomp
  while !name.empty? do
    students << {name:name,cohort: :november,hobby:hobby,country:country,height:height}
    puts "Now we have #{students.count} students"
    puts "Please enter the name of the student"
    name=gets.chomp
      if !name.empty?
      puts "Please enter the hobby of the student"
      hobby=gets.chomp
      puts "Please enter the student's country of birth"
      country=gets.chomp
      puts "Please enter the student's height"
      height=gets.chomp
      end
    end
students
end

def print_header
puts "The students of Villains Academy".center(80)
puts "---------------".center(80)
end

def print(students)
  students.each_with_index do |student,index|
  aa= "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  bb="country #{student[:country]} hobby #{student[:hobby]} height #{student[:height]}"
  puts aa.ljust(40)+bb.rjust(40)
  end
end

def print_footer(students)
  puts 
  puts "Overall, we have #{students.count} great students".center(80)
end

students=input_students
print_header
print(students)
print_footer(students)
