require 'rails_helper'

RSpec.describe Hospital do
  before :each do
    test_data
  end
  describe 'relationships' do
    it {should have_many :doctors}
  end
  describe 'validations' do
    it {should validate_presence_of :name}
  end
  describe 'instance methods' do
    it '#doctor_patient_count' do
      expect(@hospital1.doctor_patient_count).to eq([@doctor1, @doctor2])
      expect(@hospital2.doctor_patient_count).to eq([@doctor4, @doctor3])
    end
  end
end
