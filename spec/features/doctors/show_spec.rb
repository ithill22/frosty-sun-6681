require 'rails_helper'

RSpec.describe 'Doctor Show Page' do
  before :each do
    test_data
  end
  describe 'As a visitor, when I visit the doctor show page' do
    it 'I see all of the doctors information' do
      visit doctor_path(@doctor1)

      expect(page).to have_content(@doctor1.name)
      expect(page).to have_content(@doctor1.specialty)
      expect(page).to have_content(@doctor1.university)
      expect(page).to_not have_content(@doctor2.name)
    end

    it 'I see the name of the hospital where this doctor works' do
      visit doctor_path(@doctor1)

      expect(page).to have_content(@hospital1.name)
      expect(page).to_not have_content(@hospital2.name)
    end

    it 'I see the names of all of the patients this doctor has' do
      visit doctor_path(@doctor1)

      within '#patients-list' do
        expect(page).to have_content(@patient1.name)
        expect(page).to have_content(@patient2.name)
        expect(page).to have_content(@patient3.name)
        expect(page).to_not have_content(@patient4.name)
      end
    end
  end
end