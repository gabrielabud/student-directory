require 'csv'
@students=[]
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name=STDIN.gets.chomp
  puts "Please enter the cohort name"
  cohort=STDIN.gets.chomp
  while !name.empty? do
    add_students name, cohort
    puts "Now we have #{@students.count} students"
    puts "Please enter the next student's name"
    name=STDIN.gets.chomp
    if !name.empty?
      puts "Please enter the cohort name"
      cohort=STDIN.gets.chomp
    else
     return
   end
  end
end

def load_students(filename)
  CSV.foreach(filename) do |line|
      name=line[0]
      cohort=line[1]
      add_students name,cohort
  end
end

def add_students name, cohort
   @students << {name:name,cohort:cohort.to_sym}
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
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
  when "3"
    save_students
    puts "The file has been updated with the list of students provided"
  when "4"
    puts "which file you load students from"
    filename=STDIN.gets.chomp
    load_students(filename)
    puts "file loaded"
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def print_header
puts "The students of Villains Academy"
puts "---------------"
end

def print_student_list
@students.each do |student|
  puts "#{student[:name]} (#{student[:cohort]} cohort)"
end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  #open the file for writing
  puts "Which is the name of the file"
  file_inserted=STDIN.gets.chomp
  CSV.open("#{file_inserted}","w") do |csv_object|
    @students.each do |student|
      csv_object << student
    end
  end
end

def try_load_students
  filename=ARGV.first #first argument from the command line
  if filename.nil?
    puts "Would you like to load any file yes/no"
    answ=STDIN.gets.chomp
    if answ.upcase=="YES"
      puts "Which is the file you would like to load from"
      filename=STDIN.gets.chomp
    else
      return
    end
  end

  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else #if it doesn't exist
    puts "Sorry,#{filename} doesn't exists"
    exit #quit the program
  end
end

try_load_students
interactive_menu
