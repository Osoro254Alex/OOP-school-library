require_relative 'base_decorator'

class TrimmerDecorator < BaseDecorator
  MAX_NAME_LENGTH = 10
  def correct_name
    namee = @nameable.correct_name
    if namee.length > MAX_NAME_LENGTH
      namee.slice(0, MAX_NAME_LENGTH)
    else
      namee
    end
  end
end
