require 'rails_helper'

RSpec.describe 'Doctor Show Page' do
  before :each do
    test_data
  end
  describe 'As a visitor, when I visit the doctor show page' do
    it 'I see all of the doctors information' do
      visit doctor_path(@doctor_1)

      expect(page).to have_content(@doctor_1.name)
      expect(page).to have_content(@doctor_1.specialty)
      expect(page).to have_content(@doctor_1.university)
      expect(page).to_not have_content(@doctor_2.name)
    end
  end
end