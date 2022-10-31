require './person'


Class Student < Person

def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    @classroom = classroom

def play_hooky
    "¯\(ツ)/¯"
end

end