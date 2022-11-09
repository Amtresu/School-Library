require_relative 'spec_helper'

describe 'Testing class decorator ' do
  before :each do
    @person = Person.new(20, true, 'Julius')
    @name = CapitalizeDecorator.new(@person)
  end

  it 'Should make the name capitalized' do
    capitalized = @name.correct_name
    expect(capitalized).to eql 'Julius'
  end

  it 'Should trim the name' do
    trim = TrimmerDecorator.new(@name)
    trim = trim.correct_name
    expect(trim).to eql 'Julius'
  end
end
