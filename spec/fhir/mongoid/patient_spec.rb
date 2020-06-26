RSpec.describe FHIR::Patient do
  it 'Should be able to construct a patient from Patient resource and persist' do
    patient_json = File.open(File.join(File.dirname(__FILE__), '../fixture/patient.json'))
    patient_hash = JSON.load patient_json
    patient = FHIR::Patient.transform_json patient_hash
    expect do
      patient.save!
    end.to_not raise_error
    expect(patient._id).to be_present
  end
end
