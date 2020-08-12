RSpec.describe FHIR::ValueSet do
  it 'Should be able to parse serialized FHIR JSON' do
    value_set_json = File.open(File.join(File.dirname(__FILE__), '../fixture/value_set.json'))
    value_set_hash = JSON.load value_set_json
    value_set = FHIR::ValueSet.transform_json value_set_hash

    updated_value_set_json = value_set.to_json
    updated_value_set_hash =  JSON.load updated_value_set_json

    expect(DateTime.parse(value_set_hash['meta']['lastUpdated'])).to eq  DateTime.parse(updated_value_set_hash['meta']['lastUpdated'])

    expect(DateTime.parse(value_set_hash['date'])).to eq  DateTime.parse(updated_value_set_hash['date'])

    # Assert can be parsed
    updated_value_set = FHIR::ValueSet.transform_json updated_value_set_hash
    expect(updated_value_set).to be_present
    expect(updated_value_set_hash).to eq value_set_hash
  end
end
