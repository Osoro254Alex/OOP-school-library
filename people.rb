class People
  def add_new_student(people)
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.to_s
    print 'Has parent permission? [Y/N] '
    permission = gets.chomp.downcase == 'y'
    people << Student.new(age, name, parent_permission: permission)

    puts 'Person created successfully.'
  end

  def add_new_teacher(people)
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.to_s
    print 'Specialization: '
    specialization = gets.chomp.to_s
    people << Teacher.new(age, name, specialization: specialization)

    puts 'Person created successfully.'
  end

  def add_new_person(people)
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    type = gets.chomp.to_i
    case type
    when 1
      add_new_student(people)
    when 2
      add_new_teacher(people)
    else
      puts "\e[31mInvalid input. Please try again.\e[0m"
    end
  end

  def show_person(person)
    "\e[34m[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age} \e[0m"
  end

  def show_people(people)
    if people.empty?
      puts "\e[31mNo people in the library yet.\e[0m"
    else
      people.each do |person|
        puts show_person(person)
      end
    end
  end
end
