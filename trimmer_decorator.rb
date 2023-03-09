require_relative('./baseDecorator')
require_relative('./person')
require_relative('./CapitalizeDecorator')


class TrimmerDecorator < BaseDecorator
  def correct_name
    name = @nameable.correct_name
    if name.length > 10
      name.slice(0, 10)
    else
      name
    end
  end
end
