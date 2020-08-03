RSpec.describe CQM::Measure do

  before(:all) do
    @fhir_measure_hash = JSON.load(File.open(File.join(File.dirname(__FILE__), '../fixture/measure.json')))
    @library_hash = JSON.load(File.open(File.join(File.dirname(__FILE__), '../fixture/library.json')))
    @value_set_hash = JSON.load(File.open(File.join(File.dirname(__FILE__), '../fixture/value_set.json')))

    @fhir_resources_hash = JSON.load(File.open(File.join(File.dirname(__FILE__), '../fixture/fhir_resources.json')))
  end

  it 'Should be able to construct a measure from Measure resource and persist' do
    cqm_measure = load_measure

    expect do
      cqm_measure.save!
    end.to_not raise_error
    expect(cqm_measure.fhir_measure._id).to be_present
    expect(cqm_measure.fhir_measure.name.value).to eq @fhir_measure_hash['name']

    #attributes from super class should be included
    # TODO: uncomment after MAT-1342 fix
    #expect(cqm_measure.fhir_measure.extension).to be_present
    expect(cqm_measure.fhir_measure.contained).to be_present
    expect(cqm_measure.fhir_measure.meta).to be_present
  end

  it 'Should permit FHIR Resources as Source Data Criteria' do
    cqm_measure = load_measure

    source_data_criteria = CQM::DataElement.new
    source_data_criteria.fhir_resource = FHIR::Condition.transform_json @fhir_resources_hash['condition']

    cqm_measure.source_data_criteria << source_data_criteria

    expect do
      cqm_measure.save!
    end.to_not raise_error
    expect(cqm_measure._id).to be_present
    expect(cqm_measure.source_data_criteria.first._id).to be_present
    expect(cqm_measure.source_data_criteria).to include(source_data_criteria)
  end

  private

  def load_measure
    fhir_measure = FHIR::Measure.transform_json @fhir_measure_hash
    library = FHIR::Library.transform_json @library_hash
    value_set = FHIR::ValueSet.transform_json @value_set_hash

    cqm_value_set = CQM::ValueSet.new(fhir_value_set: value_set)
    CQM::Measure.new(fhir_measure: fhir_measure,
                     libraries: [library],
                     value_sets:[cqm_value_set])
  end
end
