RSpec.describe CQM::ValueSet do
  it 'Should be able to construct a value set from ValueSet and persist' do
    value_set_json = File.open(File.join(File.dirname(__FILE__), '../fixture/value_set.json'))
    value_set_hash = JSON.load value_set_json
    value_set = FHIR::ValueSet.transform_json value_set_hash
    cqm_value_set = CQM::ValueSet.new(fhir_value_set: value_set)
    expect do
      cqm_value_set.save!
    end.to_not raise_error
    expect(cqm_value_set._id).to be_present
  end

  it 'Should be able to parse serialized FHIR JSON' do
    value_set_json = File.open(File.join(File.dirname(__FILE__), '../fixture/value_set.json'))
    value_set_hash = JSON.load value_set_json
    value_set = FHIR::ValueSet.transform_json value_set_hash

    updated_value_set_json = value_set.to_json
    updated_value_set_hash =  JSON.load updated_value_set_json

    expect(DateTime.parse(value_set_hash['meta']['lastUpdated'])).to eq  DateTime.parse(updated_value_set_hash['meta']['lastUpdated'])
    value_set_hash['meta'].delete('lastUpdated')
    updated_value_set_hash['meta'].delete('lastUpdated')

    expect(DateTime.parse(value_set_hash['date'])).to eq  DateTime.parse(updated_value_set_hash['date'])
    # Date formats are different
    value_set_hash.delete('date')
    updated_value_set_hash.delete('date')

    # Assert can be parsed
    updated_value_set = FHIR::ValueSet.transform_json updated_value_set_hash
    expect(updated_value_set).to be_present
    expect(updated_value_set_hash).to eq value_set_hash
  end
end
