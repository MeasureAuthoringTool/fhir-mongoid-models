RSpec.describe 'Data Elements' do

  it 'Should be able to construct a condition from condition resource' do
    condition_json = File.open(File.join(File.dirname(__FILE__), '../fixture/condition.json'))
    condition_hash = JSON.load condition_json
    condition = FHIR::Condition.transform_json condition_hash
    expect(condition.id).to eql condition_hash['id']
    expect(condition.category[0].coding[0].display.value).to eql 'Encounter Diagnosis'
  end

  it 'Should be able to construct a encounter from encounter resource' do
    encounter_json = File.open(File.join(File.dirname(__FILE__), '../fixture/encounter.json'))
    encounter_hash = JSON.load encounter_json
    encounter = FHIR::Condition.transform_json encounter_hash
    expect(encounter.id).to eql encounter_hash['id']
  end

  it 'Should be able to construct a ServiceRequest from ServiceRequest resource' do
    service_request_json = File.open(File.join(File.dirname(__FILE__), '../fixture/service_request.json'))
    service_request_hash = JSON.load service_request_json
    service_request = FHIR::Condition.transform_json service_request_hash
    expect(service_request.id).to eql service_request_hash['id']
    expect(service_request.code.coding[0].display.value) .to eq 'Comfort measures (regime/therapy)'
  end
end
