require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    user1 = User.create! name: 'Mary', password: '000000', email: 'test@test.com',
                         confirmed_at: Time.now
    subject { Food.create(name: 'Rice', measurement_unit: 'grams', price: '10', user: user1) }
    subject.save
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Measurement unit should be present' do
    subject.measurement_unit = nil
    expect(subject).to_not be_valid
  end

  it 'Price should be present' do
    subject.price = 0
    expect(subject).to_not be_valid
  end
end
