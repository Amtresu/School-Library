Class Person 

attr_accessor :age, :name
attr_reader :id
def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..9999)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

def of_age?
    @age =< 18
end

private: of_age?

def can_use_services?
    of_age?
end

end