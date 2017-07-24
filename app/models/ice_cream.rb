class IceCream < ActiveRecord::Base
  # serialize :categories, Array
  enum course: [:app, :main, :dessert]

  def self.to_csv
    attributes = %w{name servings}
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |ice_cream| 
        csv << ice_cream.attributes.values_at(*attributes)
      end
    end
  end
end
