require_relative 'nameable'

class BaseDecorator < Nameable
  def initialize(nameable)
    super()
    @nameable_obj = nameable
  end

  def correct_name
    @nameable_obj.correct_name
  end
end
