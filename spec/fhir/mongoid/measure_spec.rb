RSpec.describe FHIR::Measure do
  it 'Should be able to construct a measure from Measure resource and persist' do
    measure_json = File.open(File.join(File.dirname(__FILE__), '../fixture/measure.json'))
    measure_hash = JSON.load measure_json
    measure = FHIR::Measure.transform_json measure_hash
    expect do
      measure.save!
    end.to_not raise_error
    expect(measure._id).to be_present
  end
end
