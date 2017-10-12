def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  students=[]
  name=gets.chomp

  puts "Please enter the cohort"
  cohort=gets.chomp
  if cohort.empty?
    puts "Let us know the cohort?"
    cohort=gets.chomp
    if cohort.empty?
      cohort="unknown".to_sym
    end
  end

  puts "Please enter the hobby of the student"
  hobby=gets.chomp
  if hobby.empty?
    puts "Let us know the hobby?"
    hobby=gets.chomp
    if hobby.empty?
      hobby="unknown".to_sym
    end
  end

  while !name.empty? do
      students << {name:name,cohort:cohort.to_sym,hobby:hobby}
      if students.length>1
       puts "Now we have #{students.count} students"
      else
       puts "Now we have #{students.count} student"
      end
      puts "Please enter the name of the student"
      name=gets.chomp
      if !name.empty?
        puts "Please enter the cohort"
        cohort=gets.chomp
        if cohort.empty?
          puts "Let us know the cohort?"
          cohort=gets.chomp
          if cohort.empty?
            cohort="unknown".to_sym
          end
        end

        puts "Please enter the hobby of the student"
        hobby=gets.chomp
        if hobby.empty?
          puts "Let us know the hobby?"
          hobby=gets.chomp
          if hobby.empty?
            hobby="unknown".to_sym
          end
        end
      end
    end
students
end

def print_header
  puts "The students of Villains Academy".center(80)
  puts "---------------".center(80)
end

def print(students)
  grouped=students.sort { |a,b| a[:cohort]<=>b[:cohort]}
  grouped.each_with_index do |student,index|
    aa= "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    bb="hobby #{student[:hobby]}"
    puts aa.ljust(40)+bb.rjust(40)
  end
end

def print_footer(students)
  puts
  if students.count>1
    puts "Overall, we have #{students.count} great students".center(80)
  else
    puts "Overall, we have #{students.count} great student".center(80)
  end
end

students=input_students
print_header
print(students)
print_footer(students)
