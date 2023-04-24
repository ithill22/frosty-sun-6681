class DoctorPatientsController < ApplicationController
  def destroy
    doctor_id = params[:doctor_id]
    patient_id = params[:id]
    doctor_patient = DoctorPatient.find_by(doctor_id: doctor_id, patient_id: patient_id)
    doctor_patient.destroy
    redirect_to doctor_path(doctor_id)
  end
end
