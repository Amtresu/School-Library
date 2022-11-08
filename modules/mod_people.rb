require './classes/person'
require './classes/student'
require './classes/teacher'
require_relative './local_storage'

module ModPeople
  include LocalStorage
  def display_people(people)
    puts 'No people available' if people.length.zero?
    people.each { |person| puts "[#{person.type}] Name: #{person.name} Age: #{person.age}" }
    menu_return
  end

  def create_person(people)
    puts '1 - Create a Student  2 - Create a Teacher'
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
    person_options(person, age, name, people)
    menu_return
  end

  def person_options(person, age, name, people)
    case person
    when '1'
      print 'Has parents permission [Y/N]: '
      permit = gets.chomp.downcase
      parent_permission = permit != 'n'
      person = Student.new(age, parent_permission, name)
    when '2'
      print 'Insert specialization: '
      specialization = gets.chomp
      person = Teacher.new(specialization, age, name)
    end
    people.push(person)
    person = { id: person.id, name: person.name, age: person.age, class_name: person.class }
    stored_people = fetch_storage('people')
    stored_people.push(person)
    update_storage('people', stored_people)
  end
end
