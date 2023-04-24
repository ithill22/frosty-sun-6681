class Hospital < ApplicationRecord
  validates_presence_of :name
  has_many :doctors

  def doctor_patient_count
    doctors.joins(:doctor_patients)
           .select('doctors.*, COUNT(doctor_patients.id) as patient_count')
           .group('doctors.id')
           .order('patient_count DESC')
  end
end
