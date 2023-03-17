require_relative '../trimmer_decorator'
require_relative '../capitalize_decorator'
require_relative '../person'

describe BaseDecorator do
  before :each do
    @person = Person.new(32, 'maximilianus', parent_permission: false)
    @capitalize = CapitalizeDecorator.new(@person)
    @trimmer = TrimmerDecorator.new(@capitalize)
  end

  it 'shoud display the correct name of person' do
    expect(@person.correct_name).to eq 'maximilianus'
  end

  it 'shoud display the correct name of person after capitalizing' do
    expect(@capitalize.correct_name).to eq 'Maximilianus'
  end

  it 'shoud display the correct name of person after trimming' do
    expect(@trimmer.correct_name).to eq 'Maximilian'
  end

  it 'should displays slice of the name if it is more than 10 char' do
    expect(@trimmer.correct_name).to eq 'Maximilian'
    expect(@trimmer.correct_name.length).to be <= 10
  end
end
