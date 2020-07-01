RSpec.describe CQM::Patient do
  it 'Should be able to construct a patient from Patient resource and persist' do
    patient_json = File.open(File.join(File.dirname(__FILE__), '../fixture/patient.json'))
    patient_hash = JSON.load patient_json
    patient = FHIR::Patient.transform_json patient_hash
    bonnie_patient = CQM::Patient.new(fhir_patient: patient)
    expect do
      bonnie_patient.save!
    end.to_not raise_error
    expect(bonnie_patient._id).to be_present
  end
end
