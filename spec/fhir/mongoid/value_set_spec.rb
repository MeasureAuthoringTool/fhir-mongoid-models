RSpec.describe FHIR::ValueSet do
  it 'Should be able to construct a value set from ValueSet and persist' do
    value_set_json = File.open(File.join(File.dirname(__FILE__), '../fixture/value_set.json'))
    value_set_hash = JSON.load value_set_json
    value_set = FHIR::ValueSet.transform_json value_set_hash
    expect do
      value_set.save!
    end.to_not raise_error
    expect(value_set._id).to be_present
  end
end
