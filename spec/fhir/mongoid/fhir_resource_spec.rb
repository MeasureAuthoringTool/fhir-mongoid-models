RSpec.describe 'FHIR Resources' do

  fhir_resource_hash = {}

  before(:all) do
    fhir_resources_json = File.open(File.join(File.dirname(__FILE__), '../fixture/fhir_resources.json'))
    fhir_resource_hash = JSON.load fhir_resources_json
  end

  it 'Should be able to construct a condition from condition resource' do
    condition_hash = fhir_resource_hash['condition']
    condition = FHIR::Condition.transform_json condition_hash
    expect(condition.fhirId).to eql condition_hash['id']
    expect(condition.category[0].coding[0].display.value).to eql 'Encounter Diagnosis'

    expect(condition_hash).to eq condition.as_json
  end

  it 'Should be able to construct a encounter from encounter resource' do
    pending("FIXME reserved words are not handled in Encounter")
    encounter_hash = fhir_resource_hash['encounter']
    encounter = FHIR::Encounter.transform_json encounter_hash
    expect(encounter.fhirId).to eql encounter_hash['id']

    expect(encounter_hash).to eq encounter.as_json
  end

  it 'Should be able to construct a ServiceRequest from ServiceRequest resource' do
    service_request_hash = fhir_resource_hash['service_request']
    service_request = FHIR::ServiceRequest.transform_json service_request_hash
    expect(service_request.fhirId).to eql service_request_hash['id']
    expect(service_request.code.coding[0].display.value) .to eq 'Comfort measures (regime/therapy)'

    updated_hash = service_request.as_json
    updated_hash.delete('authoredOn')
    service_request_hash.delete('authoredOn')
    expect(service_request_hash).to eq updated_hash
  end

  it 'Should be able to construct a MedicationAdministration from MedicationAdministration resource' do
    medication_hash = fhir_resource_hash['Medication_administration']
    meds_administration = FHIR::MedicationAdministration.transform_json medication_hash
    expect(meds_administration.fhirId).to eql medication_hash['id']
    expect(meds_administration.medicationCodeableConcept.coding[0].display.value) .to eq '0.3 ML Enoxaparin sodium 100 MG/ML Prefilled Syringe'

    updated_hash = meds_administration.as_json
    updated_hash.delete('effectivePeriod')
    medication_hash.delete('effectivePeriod')
    expect(medication_hash).to eq updated_hash

  end

  it 'Should be able to construct a procedure from procedure resource' do
    procedure_hash = fhir_resource_hash['procedure']
    procedure = FHIR::Procedure.transform_json procedure_hash
    expect(procedure.fhirId).to eql procedure_hash['id']
    expect(procedure.code.coding[0].display.value) .to eq 'Epidural injection of anesthetic substance'

    updated_hash = procedure.as_json
    updated_hash.delete('performedPeriod')
    procedure_hash.delete('performedPeriod')
    expect(procedure_hash).to eq updated_hash
  end

  it 'Should be able to construct a observation from observation resource' do
    observation_hash = fhir_resource_hash['observation']
    observation = FHIR::Observation.transform_json observation_hash
    expect(observation.fhirId).to eql observation_hash['id']
    expect(observation.code.coding[0].display.value) .to eq 'Microscopic observation [Identifier] in Cervix by Cyto stain'

    observation_hash.delete('effectiveDateTime')
    updated_hash = observation.as_json
    updated_hash.delete('effectiveDateTime')
    expect(observation_hash).to eq updated_hash
  end
end
