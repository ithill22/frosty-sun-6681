require 'rails_helper'

RSpec.describe Patient do
  before :each do
    test_data
  end
  describe 'relationships' do
    it {should have_many :doctor_patients}
    it {should have_many(:doctors).through(:doctor_patients)}
  end
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end

  describe 'class methods' do
    it '.adults_az' do
      expect(Patient.adults_az).to eq([@patient2, @patient1, @patient3])
    end
  end
end