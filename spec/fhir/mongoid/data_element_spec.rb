RSpec.describe 'Data Elements' do

  data_elements_hash = {}

  before(:all) do
    data_elements_json = File.open(File.join(File.dirname(__FILE__), '../fixture/data_elements.json'))
    data_elements_hash = JSON.load data_elements_json
  end

  it 'Should be able to construct a condition from condition resource' do
    condition_hash = data_elements_hash['condition']
    condition = FHIR::Condition.transform_json condition_hash
    expect(condition.id).to eql condition_hash['id']
    expect(condition.category[0].coding[0].display.value).to eql 'Encounter Diagnosis'
  end

  it 'Should be able to construct a encounter from encounter resource' do
    encounter_hash = data_elements_hash['encounter']
    encounter = FHIR::Condition.transform_json encounter_hash
    expect(encounter.id).to eql encounter_hash['id']
  end

  it 'Should be able to construct a ServiceRequest from ServiceRequest resource' do
    service_request_hash = data_elements_hash['service_request']
    service_request = FHIR::Condition.transform_json service_request_hash
    expect(service_request.id).to eql service_request_hash['id']
    expect(service_request.code.coding[0].display.value) .to eq 'Comfort measures (regime/therapy)'
  end

  it 'Should be able to construct a MedicationAdministration from MedicationAdministration resource' do
    medication_hash = data_elements_hash['Medication_administration']
    meds_administration = FHIR::MedicationAdministration.transform_json medication_hash
    expect(meds_administration.id).to eql medication_hash['id']
    expect(meds_administration.medicationCodeableConcept.coding[0].display.value) .to eq '0.3 ML Enoxaparin sodium 100 MG/ML Prefilled Syringe'
  end

  it 'Should be able to construct a procedure from procedure resource' do
    procedure_hash = data_elements_hash['procedure']
    procedure = FHIR::Procedure.transform_json procedure_hash
    expect(procedure.id).to eql procedure_hash['id']
    expect(procedure.code.coding[0].display.value) .to eq 'Epidural injection of anesthetic substance'
  end

  it 'Should be able to construct a observation from observation resource' do
    observation_hash = data_elements_hash['observation']
    observation = FHIR::Observation.transform_json observation_hash
    expect(observation.id).to eql observation_hash['id']
    expect(observation.code.coding[0].display.value) .to eq 'Microscopic observation [Identifier] in Cervix by Cyto stain'
  end
end
