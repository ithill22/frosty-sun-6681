# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start

require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
end

def test_data
  @hospital1 = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
  @hospital2 = Hospital.create!(name: 'Seaside Health & Wellness Center')

  @doctor1 = @hospital1.doctors.create!(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University')
  @doctor2 = @hospital1.doctors.create!(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University')
  @doctor3 = @hospital2.doctors.create!(name: 'Miranda Bailey', specialty: 'General Surgery', university: 'Stanford University')
  @doctor4 = @hospital2.doctors.create!(name: 'Derek McDreamy Shepherd', specialty: 'Attending Surgeon', university: 'University of Pennsylvania')

  @patient1 = Patient.create!(name: 'Katie Bryce', age: 24)
  @patient2 = Patient.create!(name: 'Denny Duquette', age: 39)
  @patient3 = Patient.create!(name: 'Rebecca Pope', age: 32)
  @patient4 = Patient.create!(name: 'Zola Shepherd', age: 2)
  @patient5 = Patient.create!(name: 'Meredith Grey', age: 16)

  @doctor_patient1 = DoctorPatient.create!(doctor: @doctor1, patient: @patient1)
  @doctor_patient2 = DoctorPatient.create!(doctor: @doctor1, patient: @patient2)
  @doctor_patient3 = DoctorPatient.create!(doctor: @doctor1, patient: @patient3)
  @doctor_patient4 = DoctorPatient.create!(doctor: @doctor2, patient: @patient1)
  @doctor_patient5 = DoctorPatient.create!(doctor: @doctor2, patient: @patient4)
  @doctor_patient6 = DoctorPatient.create!(doctor: @doctor3, patient: @patient2)
  @doctor_patient7 = DoctorPatient.create!(doctor: @doctor3, patient: @patient3)
  @doctor_patient8 = DoctorPatient.create!(doctor: @doctor4, patient: @patient5)
  @doctor_patient9 = DoctorPatient.create!(doctor: @doctor4, patient: @patient4)
  @doctor_patient10 = DoctorPatient.create!(doctor: @doctor4, patient: @patient1)
  @doctor_patient11 = DoctorPatient.create!(doctor: @doctor4, patient: @patient2)
  @doctor_patient12 = DoctorPatient.create!(doctor: @doctor4, patient: @patient3)
end
