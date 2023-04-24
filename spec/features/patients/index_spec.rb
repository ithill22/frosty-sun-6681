require 'rails_helper'

RSpec.describe 'Patients Index Page' do
  before :each do
    test_data
    visit patients_path
  end
  describe 'As a visitor, when I visit the Patients Index Page' do
    it 'I see the names of all adult patients listed in alphabetical order' do
      within '#patients-list' do
        expect(page).to_not have_content(@patient4.name)
        expect(page).to_not have_content(@patient5.name)
        expect(@patient2.name).to appear_before(@patient1.name)
        expect(@patient1.name).to appear_before(@patient3.name)
      end
    end
  end
end