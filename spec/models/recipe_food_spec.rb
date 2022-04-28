require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before(:each) do
    user1 = User.create! name: 'Mary', password: '888888', email: 'test@test.com',
                         confirmed_at: Time.now
    food = Food.new(name: 'Jam', measurement_unit: 'grams', price: '20', user: user1)

    recipe = user1.recipes.new(name: 'Sandwich', cooking_time: '30 mins', preperation_time: '1 min',
                               description: 'How to')

    subject { RecipeFood.new(food:, quantity: 5, recipe:) }

    subject.save
  end

  it 'quantity cannot be less than 1' do
    subject.quantity = 0.5
    expect(subject).to_not be_valid
  end
end
