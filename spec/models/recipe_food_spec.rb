require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let(:user) { User.create(name: 'Rida', email: 'example@mail.com', password: 'password') }
  let(:food) { Food.create(user_id: user.id, name: 'Apple', measurementUnit: 'kg', price: 12) }
  let(:recipe) do
    Recipe.create(name: 'Pizza', cookingTime: 1, preparationTime: 2, description: 'hgghghghghh', public: false,
                  user_id: user.id)
  end

  let(:recipe_food) { RecipeFood.create(quantity: 10, food_id: food.id, recipe_id: recipe.id) }
  describe 'Validations' do
    context 'when valid' do
      it { expect(recipe_food).to be_valid }
    end

    it 'should allow valid quantity' do
      recipe_food.quantity = 'Eg'
      expect(recipe_food).to_not be_valid
    end

    it 'should allow valid quantity' do
      recipe_food.quantity = -3
      expect(recipe_food).to_not be_valid
    end

    it 'should allow valid quantity' do
      recipe_food.quantity = 3
      expect(recipe_food).to be_valid
    end
  end
end
