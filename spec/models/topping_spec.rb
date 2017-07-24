require 'rails_helper'

RSpec.describe Topping, type: :model do
  describe '#eligible_ice_creams' do
    let(:topping) { create(:topping, course: Topping.courses[:app], category: Topping.categories[:sweet], release_month: DateTime.now) }

    it 'returns only eligible ice creams' do
      eligible_ice_cream = IceCream.create(categories: 'sweet', servings: 0, release_end: topping.release_month + 1.week, course: IceCream.courses[:app], release_start: topping.release_month - 1.day)
      non_eligible_ice_cream = IceCream.create(categories: 'savory', servings: 100, release_end: topping.release_month - 1.week, course: IceCream.courses[:dessert], release_start: topping.release_month - 1.month)

      ice_creams = topping.eligible_ice_creams

      expect(ice_creams.first.release_start).to be < topping.release_month
      expect(ice_creams.first.release_end).to be > topping.release_month
      expect(ice_creams.first.categories).to eq('sweet')
      expect(ice_creams.first.servings).to be < 30
      expect(ice_creams.first.course).to eq topping.course
      expect(ice_creams.count).to eq 1
    end
  end
end
