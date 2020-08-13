RSpec.describe 'Populations' do

  it 'can serialize/deserialize CQM::StatementReference' do
    st_ref = CQM::StatementReference.new
    st_ref.library_name = 'library1'
    st_ref.statement_name = 'name1'

    st_ref_hash = st_ref.as_json
    expect(st_ref_hash).to be_present

    st_ref_json = st_ref.to_json
    expect(st_ref_json).to be_present

    updated_st_ref = CQM::StatementReference.transform_json st_ref_hash
    expect(updated_st_ref).to be_present
    expect(updated_st_ref.as_json).to eq st_ref_hash
  end

  it 'can serialize/deserialize CQM::CohortPopulationMap' do
    it = CQM::CohortPopulationMap.new
    it.IPP = CQM::StatementReference.new(library_name: 'library1', statement_name: 'name1')

    it_hash = it.as_json
    expect(it_hash).to be_present

    it_json = it.to_json
    expect(it_json).to be_present

    updated_it = CQM::CohortPopulationMap.transform_json it_hash
    expect(updated_it).to be_present
    expect(updated_it.as_json).to eq it_hash
  end

  it 'can serialize/deserialize CQM::ContinuousVariablePopulationMap' do
    it = CQM::ContinuousVariablePopulationMap.new
    it.IPP = CQM::StatementReference.new(library_name: 'library_IPP', statement_name: 'name_IPP')
    it.MSRPOPL = CQM::StatementReference.new(library_name: 'library_MSRPOPL', statement_name: 'name_MSRPOPL')
    it.MSRPOPLEX = CQM::StatementReference.new(library_name: 'library_MSRPOPLEX', statement_name: 'name_MSRPOPLEX')

    it_hash = it.as_json
    expect(it_hash).to be_present

    it_json = it.to_json
    expect(it_json).to be_present

    updated_it = CQM::ContinuousVariablePopulationMap.transform_json it_hash
    expect(updated_it).to be_present
    expect(updated_it.as_json).to eq it_hash
  end

  it 'can serialize/deserialize CQM::RatioPopulationMap' do
    it = CQM::RatioPopulationMap.new

    it.IPP = CQM::StatementReference.new(library_name: 'library_IPP', statement_name: 'name_IPP')
    it.DENOM = CQM::StatementReference.new(library_name: 'library_DENOM', statement_name: 'name_DENOM')
    it.NUMER = CQM::StatementReference.new(library_name: 'library_NUMER', statement_name: 'name_NUMER')
    it.NUMEX = CQM::StatementReference.new(library_name: 'library_NUMEX', statement_name: 'name_NUMEX')
    it.DENEX = CQM::StatementReference.new(library_name: 'library_DENEX', statement_name: 'name_DENEX')

    it_hash = it.as_json
    expect(it_hash).to be_present

    it_json = it.to_json
    expect(it_json).to be_present

    updated_it = CQM::RatioPopulationMap.transform_json it_hash
    expect(updated_it).to be_present
    expect(updated_it.as_json).to eq it_hash
  end

  it 'can serialize/deserialize CQM::ProportionPopulationMap' do
    it = CQM::ProportionPopulationMap.new

    it.IPP = CQM::StatementReference.new(library_name: 'library_IPP', statement_name: 'name_IPP')
    it.DENOM = CQM::StatementReference.new(library_name: 'library_DENOM', statement_name: 'name_DENOM')
    it.NUMER = CQM::StatementReference.new(library_name: 'library_NUMER', statement_name: 'name_NUMER')
    it.NUMEX = CQM::StatementReference.new(library_name: 'library_NUMEX', statement_name: 'name_NUMEX')
    it.DENEX = CQM::StatementReference.new(library_name: 'library_DENEX', statement_name: 'name_DENEX')
    it.DENEXCEP = CQM::StatementReference.new(library_name: 'library_DENEXCEP', statement_name: 'name_DENEXCEP')

    it_hash = it.as_json
    expect(it_hash).to be_present

    it_json = it.to_json
    expect(it_json).to be_present

    updated_it = CQM::ProportionPopulationMap.transform_json it_hash
    expect(updated_it).to be_present
    expect(updated_it.as_json).to eq it_hash
  end

  it 'can serialize/deserialize CQM::PopulationMap' do
    it = CQM::PopulationMap.new

    it_hash = it.as_json
    expect(it_hash).to be

    it_json = it.to_json
    expect(it_json).to be_present

    updated_it = CQM::PopulationMap.transform_json it_hash
    expect(updated_it).to be_present
    expect(updated_it.as_json).to eq it_hash
  end

  it 'can serialize/deserialize CQM::Observation' do
    it = CQM::Observation.new

    it.observation_function = CQM::StatementReference.new(library_name: 'library_observation_function', statement_name: 'name_observation_function')
    it.observation_parameter = CQM::StatementReference.new(library_name: 'library_observation_parameter', statement_name: 'name_observation_parameter')
    it.aggregation_type = 'random_aggregation_type'
    it.set_id = 'random_set_id'

    it_hash = it.as_json
    expect(it_hash).to be_present

    it_json = it.to_json
    expect(it_json).to be_present

    updated_it = CQM::Observation.transform_json it_hash
    expect(updated_it).to be_present
    expect(updated_it.as_json).to eq it_hash
  end

  it 'can serialize/deserialize CQM::Stratification' do
    it = CQM::Stratification.new

    it.title = 'random title'
    it.stratification_id = 'random stratification id'
    it.set_id = 'random set id'
    it.statement = CQM::StatementReference.new(library_name: 'library_observation_function', statement_name: 'name_observation_function')

    it_hash = it.as_json
    expect(it_hash).to be_present

    it_json = it.to_json
    expect(it_json).to be_present

    updated_it = CQM::Stratification.transform_json it_hash
    expect(updated_it).to be_present
    expect(updated_it.as_json).to eq it_hash
  end

  it 'can serialize/deserialize CQM::PopulationSet' do
    it = CQM::PopulationSet.new

    it.populations = CQM::CohortPopulationMap.new(IPP: CQM::StatementReference.new(
        library_name: 'library_CohortPopulationMap',
        statement_name: 'name_CohortPopulationMap'))

    it.stratifications = [
        CQM::Stratification.new(
          title: 'title_Stratification',
          stratification_id: 'random_stratification_id',
          set_id: 'random_set_id',
          statement: CQM::StatementReference.new(
              library_name: 'library_Stratification',
              statement_name: 'name_Stratification'))
    ]
    it.supplemental_data_elements = [
        CQM::StatementReference.new(
            library_name: 'library_name_ref1',
            statement_name: 'name_ref1'),
        CQM::StatementReference.new(
            library_name: 'library_name_ref2',
            statement_name: 'name_ref2'),
    ]
    it.observations = [
        CQM::Observation.new(
            observation_function: CQM::StatementReference.new(
                library_name: 'observation_function_library_name_1',
                statement_name: 'observation_function_statement_name_1'),
            observation_parameter: CQM::StatementReference.new(
                library_name: 'observation_parameter_library_name_1',
                statement_name: 'observation_parameter_statement_name_1'),
            aggregation_type: 'aggregation_type_1',
            set_id: 'set_id_1'
        ),
        CQM::Observation.new(
            observation_function: CQM::StatementReference.new(
                library_name: 'observation_function_library_name_2',
                statement_name: 'observation_function_statement_name_2'),
            observation_parameter: CQM::StatementReference.new(
                library_name: 'observation_parameter_library_name_2',
                statement_name: 'observation_parameter_statement_name_2'),
            aggregation_type: 'aggregation_type_2',
            set_id: 'set_id_2'
        )
    ]

    it_hash = it.as_json
    expect(it_hash).to be_present

    it_json = it.to_json
    expect(it_json).to be_present

    updated_it = CQM::PopulationSet.transform_json it_hash
    expect(updated_it).to be_present
    expect(updated_it.as_json).to eq it_hash
  end

end
