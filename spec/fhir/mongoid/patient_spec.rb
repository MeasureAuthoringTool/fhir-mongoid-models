RSpec.describe CQM::Patient do
  it 'Should be able to construct a patient from Patient resource and persist' do
    patient_json = File.open(File.join(File.dirname(__FILE__), '../fixture/patient.json'))
    patient_hash = JSON.load patient_json
    patient = FHIR::Patient.transform_json patient_hash
    cqm_patient = CQM::Patient.new(fhir_patient: patient)
    expect do
      cqm_patient.save!
    end.to_not raise_error
    expect(cqm_patient._id).to be_present
  end

  it 'Should permit FHIR Resources as Data Elements' do
    # Load various FHIR Resources
    data_elements_json = File.open(File.join(File.dirname(__FILE__), '../fixture/fhir_resources.json'))
    data_elements_hash = JSON.load data_elements_json

    # Load test patient
    patient_json = File.open(File.join(File.dirname(__FILE__), '../fixture/patient.json'))
    patient_hash = JSON.load patient_json
    patient = FHIR::Patient.transform_json patient_hash

    # New DataElement with FHIR Resource
    data_element = CQM::DataElement.new
    data_element.fhir_resource = FHIR::Condition.transform_json data_elements_hash['condition']

    # Add DataElement to test patient
    cqm_patient = CQM::Patient.new(fhir_patient: patient)
    cqm_patient.data_elements << data_element

    # Persist
    expect do
      cqm_patient.save!
    end.to_not raise_error
    expect(cqm_patient._id).to be_present
    expect(cqm_patient.data_elements).to include(data_element)
  end
end
