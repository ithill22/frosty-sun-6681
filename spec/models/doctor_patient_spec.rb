require 'rails_helper'

RSpec.describe DoctorPatient do
  describe 'relationships' do
    it {should belong_to :doctor}
    it {should belong_to :patient}
  end
  describe 'validations' do
    it {should validate_presence_of :doctor_id}
    it {should validate_presence_of :patient_id}
  end
end