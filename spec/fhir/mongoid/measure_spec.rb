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
    expect(cqm_measure.fhir_measure.extension).to be_present
    expect(cqm_measure.fhir_measure.contained).to be_present
    expect(cqm_measure.fhir_measure.meta).to be_present

    # puts cqm_measure.to_json
    # Make sure that the CQM measure can be serialized and deserialized correctly
    expect(cqm_measure).to eq CQM::Measure.transform_json(cqm_measure.as_json)
  end

  it 'Should be able to serialize measure in FHIR JSON' do
    fhir_measure = FHIR::Measure.transform_json @fhir_measure_hash
    expect(fhir_measure).to be_present
    # puts fhir_measure.to_json
    updated_fhir_measure_json = fhir_measure.to_json
    updated_fhir_measure_hash =  JSON.load updated_fhir_measure_json
    updated_fhir_measure = FHIR::Measure.transform_json updated_fhir_measure_hash
    expect(updated_fhir_measure).to be_present

    expect(updated_fhir_measure_hash).to eq @fhir_measure_hash
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

    # puts cqm_measure.to_json
  end

  it 'should serialize and deserialize' do
    cqm_measure = CQM::Measure.new
    cqm_measure.fhir_measure = FHIR::Measure.new

    source_data_criteria = CQM::DataElement.new
    source_data_criteria.fhir_resource = FHIR::Condition.transform_json @fhir_resources_hash['condition']
    cqm_measure.source_data_criteria = [source_data_criteria]

    cql_libraries = CQM::LogicLibrary.new
    cql_libraries.library_name = 'lib1v1'
    cqm_measure.cql_libraries = [cql_libraries]

    libraries = FHIR::Library.new
    cqm_measure.libraries = [libraries]

    value_sets = FHIR::ValueSet.new
    cqm_measure.value_sets = [value_sets]

    expect(cqm_measure).to be_present
    expect(cqm_measure).to eq CQM::Measure.transform_json(cqm_measure.as_json)
  end

  private

  def load_measure
    fhir_measure = FHIR::Measure.transform_json @fhir_measure_hash
    library = FHIR::Library.transform_json @library_hash
    value_set = FHIR::ValueSet.transform_json @value_set_hash

    CQM::Measure.new(fhir_measure: fhir_measure,
                     libraries: [library],
                     value_sets:[value_set])
  end
end
