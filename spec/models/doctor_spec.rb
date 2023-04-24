require 'rails_helper'

RSpec.describe Doctor do
  before :each do
    test_data
  end
  describe 'relationships' do
    it {should belong_to :hospital}
    it {should have_many :doctor_patients}
    it {should have_many(:patients).through(:doctor_patients)}
  end
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :specialty}
    it {should validate_presence_of :university}
  end

  describe 'instance methods' do
    it '#hospital_name' do
      expect(@doctor1.hospital_name).to eq(@hospital1.name)
    end
  end
end
