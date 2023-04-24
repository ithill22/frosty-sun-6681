require 'rails_helper'

RSpec.describe 'Hospital Show Page' do
  before :each do
    test_data
  end
  describe 'as a visitor, when I visit a hospital show page' do
    it 'I see the hospital name and a list of doctors that work at that hospital' do
      visit hospital_path(@hospital1)

      expect(page).to have_content(@hospital1.name)
      within '#doctors-list' do
        expect(page).to have_content(@doctor1.name)
        expect(page).to have_content(@doctor2.name)
        expect(page).to_not have_content(@doctor3.name)
      end

      visit hospital_path(@hospital2)

      expect(page).to have_content(@hospital2.name)
      within '#doctors-list' do
        expect(page).to have_content(@doctor3.name)
        expect(page).to have_content(@doctor4.name)
        expect(page).to_not have_content(@doctor1.name)
      end
    end

    it 'I see the number of patients each doctor has, and doctors should be listed in order of most patients to least' do
      visit hospital_path(@hospital1)

      within '#doctors-list' do
        expect(@doctor1.name).to appear_before(@doctor2.name)
      end
      within "#doctor-#{@doctor1.id}" do
        expect(page).to have_content('3')
      end
      within "#doctor-#{@doctor2.id}" do
        expect(page).to have_content('2')
      end

      visit hospital_path(@hospital2)
      within '#doctors-list' do
        expect(@doctor4.name).to appear_before(@doctor3.name)
      end
      within "#doctor-#{@doctor4.id}" do
        expect(page).to have_content('5')
      end
      within "#doctor-#{@doctor3.id}" do
        expect(page).to have_content('2')
      end
    end
  end
end