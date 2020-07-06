RSpec.describe CQM::Measure do
  it 'Should be able to construct a measure from Measure resource and persist' do
    fhir_measure_json = File.open(File.join(File.dirname(__FILE__), '../fixture/measure.json'))
    fhir_measure_hash = JSON.load fhir_measure_json
    fhir_measure = FHIR::Measure.transform_json fhir_measure_hash

    library_json = File.open(File.join(File.dirname(__FILE__), '../fixture/library.json'))
    library_hash = JSON.load library_json
    library = FHIR::Library.transform_json library_hash

    value_set_json = File.open(File.join(File.dirname(__FILE__), '../fixture/value_set.json'))
    value_set_hash = JSON.load value_set_json
    value_set = FHIR::ValueSet.transform_json value_set_hash
    cqm_value_set = CQM::ValueSet.new(fhir_value_set: value_set)
    cqm_measure = CQM::Measure.new(fhir_measure: fhir_measure,
                                      libraries: [library],
                                      value_sets:[cqm_value_set])

    expect do
      cqm_measure.save!
    end.to_not raise_error
    expect(cqm_measure.fhir_measure._id).to be_present
    expect(cqm_measure.fhir_measure.name.value).to eq fhir_measure_hash['name']

    #attributes from super class should be included
    expect(cqm_measure.fhir_measure.extension).to be_present
    expect(cqm_measure.fhir_measure.contained).to be_present
    expect(cqm_measure.fhir_measure.meta).to be_present
  end
end
