class Topping < ActiveRecord::Base
  belongs_to :add_on

  enum category: [:sweet, :fruity, :savory, :candy]
  enum course: [:app, :main, :dessert]

  def eligible_ice_creams
    IceCream.select do |a|
      a.servings < 30 &&
      a.release_start < release_month &&
      a.release_end > release_month &&
      a.categories.include?(category) &&
      a.course == course
    end
  end
end
