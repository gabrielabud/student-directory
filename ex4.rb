def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students=[]
  name=gets.chomp
  while !name.empty? do
    students << {name:name,cohort: :november}
    puts "Now we have #{students.count} students"
    name=gets.chomp
  end
  students
end

def print_header
puts "The students of Villains Academy"
puts "---------------"
end

def print(students)
len=students.length
i=0
while i<len
  filter_name=students[i][:name].to_s
  if filter_name.length<12
  puts "#{students[i][:name]} (#{students[i][:cohort]} cohort)"
  end
  i=i+1
end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
students=input_students
print_header
print(students)
print_footer(students)
