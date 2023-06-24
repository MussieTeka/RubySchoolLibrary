require_relative 'base_decorator'

class CapitalizeDecorator < BaseDecorator
  def get_correct_name
    @nameable_obj.get_correct_name.capitalize
  end
end
