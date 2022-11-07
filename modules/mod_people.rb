require './classes/person'
require './classes/student'
require './classes/teacher'
module ModPeople
  def list_people(people)
    puts 'No person available' if people.length.zero?
    people.each { |person| puts "[#{person.type}] Name: #{person.name} Age: #{person.age}" }
    back_to_menu
  end

  def create_person(people)
    puts '1 - Create Student  2 - Create Teacher'
    person = gets.chomp
    if person >= '3'
      puts 'invalid selection, please select student or teacher'
      return(create_person(people))
    end
    print 'Insert age: '
    age = gets.chomp
    if age.empty?
      puts 'No age submitted, please try again'
      return(create_person(people))
    end
    print 'Insert name: '
    name = gets.chomp.capitalize
    if name.empty?
      puts 'No name submitted, please try again'
      return(create_person(people))
    end
    person_condition(person, age, name, people)
    back_to_menu
  end

  def person_condition(person, age, name, people)
    case person
    when '1'
      print 'Has parents permission [Y/N]: '
      permit = gets.chomp.downcase
      parent_permission = permit != 'n'
      people.push(Student.new(age, parent_permission, name))
    when '2'
      print 'Insert specialization: '
      specialization = gets.chomp
      teacher = Teacher.new(specialization, age, name)
      people.push(teacher)
    end
  end
end
