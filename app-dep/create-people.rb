class CreatePeople
    def initialize(everyone)
      @everyone = everyone
    end
  
    def create_person
      print('Do you want to create a student(1) or a teacher(2)? [Input the number]:')
      selected = gets.chomp.to_i
      if selected != 1 && selected != 2
        puts('invalid, select 1 for teacher or 2 for student')
        create_person
      end
      case selected
      when 1
        create_student
      when 2
        create_teacher
      end
    end
  
    def create_teacher
      print('Age: ')
      age = gets.chomp
      print('Name: ')
      name = gets.chomp
      print('Specialization: ')
      specialization = gets.chomp
      teacher = Teacher.new(specialization, age, name)
      @everyone.push(
        { display: "[Teacher] Name: #{name}, ID: #{teacher.id} Age: #{age}",
          object: teacher }
      )
      puts('Person created successfully!')
    end
  
    def create_student
      puts('Age: ')
      age = gets.chomp
      puts('Name: ')
      name = gets.chomp
      puts('Has parent permission? [ Y | N ]')
      parental_permission = gets.chomp
      parental_permission = case parental_permission.downcase
                            when 'y'
                              true
                            else
                              false
                            end
      student = Student.new('Any', age, name, parental_permission)
      @everyone.push({ display: "[Student] Name: #{name}, ID: #{student.id} Age: #{age}",
                       object: student })
      puts('Person created successfully!')
    end
  end