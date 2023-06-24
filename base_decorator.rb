require_relative 'nameable'

class BaseDecorator < Nameable
  def initialize(nameable)
    super()
    @nameable_obj = nameable
  end

  def get_correct_name
    @nameable_obj.get_correct_name
  end
end
