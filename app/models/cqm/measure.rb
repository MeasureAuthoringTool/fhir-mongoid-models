module CQM
  # bonnie/measure.rb
  class Measure
    include Mongoid::Document
    include Mongoid::Timestamps

    IPP = 'IPP'.freeze
    DENOM = 'DENOM'.freeze
    NUMER = 'NUMER'.freeze
    NUMEX = 'NUMEX'.freeze
    DENEXCEP = 'DENEXCEP'.freeze
    DENEX = 'DENEX'.freeze
    MSRPOPL = 'MSRPOPL'.freeze
    OBSERV = 'OBSERV'.freeze
    MSRPOPLEX = 'MSRPOPLEX'.freeze

    STRAT = 'STRAT'.freeze

    ALL_POPULATION_CODES = [STRAT, IPP, DENOM, DENEX, NUMER, NUMEX, DENEXCEP, MSRPOPL, OBSERV, MSRPOPLEX].freeze

    CQL_SKIP_STATEMENTS = ['SDE Ethnicity', 'SDE Payer', 'SDE Race', 'SDE Sex'].freeze

    # A CMS-style string (e.g. "CMS2v4") for the measure
    field :cms_id, type: String
    field :title, type: String, default: ''
    field :description, type: String, default: ''

    # A version-specific UUID for the measure
    field :set_id, type: String
    field :calculation_method, type: String, default: 'PATIENT'
    field :calculate_sdes, type: Boolean

    embeds_one :fhir_measure, class_name: 'FHIR::Measure'
    embeds_many :libraries, class_name: 'FHIR::Library'
    embeds_many :value_sets, class_name: 'FHIR::ValueSet'
    has_one :package, class_name: 'CQM::MeasurePackage', inverse_of: :measure, dependent: :destroy

    # ELM/CQL Measure-logic related data
    # Field name changed from 'cql' to 'cql_libraries' because the semantics of
    # 'embeds_many :cqls' sounded weird
    embeds_many :cql_libraries, class_name: 'CQM::LogicLibrary'
    field :main_cql_library, type: String

    embeds_many :source_data_criteria, class_name: 'CQM::DataElement'

    embeds_many :population_sets, class_name: 'CQM::PopulationSet'

    # TODO: Reconsider after MAT-1628
    field :measure_period, type: Hash

    def as_json(*args)
      result = Hash.new
      unless self.id.nil?
        result['id'] = self.id.to_s
      end
      unless self.cms_id.nil?
        result['cms_id'] = self.cms_id
      end
      unless self.title.nil?
        result['title'] = self.title
      end
      unless self.description.nil?
        result['description'] = self.description
      end
      unless self.set_id.nil?
        result['set_id'] = self.set_id
      end
      unless self.calculation_method.nil?
        result['calculation_method'] = self.calculation_method
      end
      unless self.calculate_sdes.nil?
        result['calculate_sdes'] = self.calculate_sdes
      end
      unless self.fhir_measure.nil?
        result['fhir_measure'] = self.fhir_measure.as_json(*args)
      end
      unless self.libraries.nil?  || !self.libraries.any?
        result['libraries'] = self.libraries.map{ |x| x.as_json(*args) }
      end
      unless self.value_sets.nil?  || !self.value_sets.any?
        result['value_sets'] = self.value_sets.map{ |x| x.as_json(*args) }
      end
      unless self.cql_libraries.nil?  || !self.cql_libraries.any?
        result['cql_libraries'] = self.cql_libraries.map{ |x| x.as_json(*args) }
      end
      unless self.main_cql_library.nil?
        result['main_cql_library'] = self.main_cql_library
      end
      unless self.source_data_criteria.nil?  || !self.source_data_criteria.any?
        result['source_data_criteria'] = self.source_data_criteria.map{ |x| x.as_json(*args) }
      end
      unless self.population_sets.nil?  || !self.population_sets.any?
        result['population_sets'] = self.population_sets.map{ |x| x.as_json(*args) }
      end
      unless self.measure_period.nil?
        result['measure_period'] = self.measure_period
      end
      result['created_at'] = self.created_at unless self.created_at.nil?
      result['updated_at'] = self.updated_at unless self.updated_at.nil?

      result
    end

    def self.transform_json(json_hash, target = Measure.new)
      result = target
      result['id'] = json_hash['id'] unless json_hash['id'].nil?
      result['cms_id'] = json_hash['cms_id'] unless json_hash['cms_id'].nil?
      result['title'] = json_hash['title'] unless json_hash['title'].nil?
      result['description'] = json_hash['description'] unless json_hash['description'].nil?
      result['set_id'] = json_hash['set_id'] unless json_hash['set_id'].nil?
      result['calculation_method'] = json_hash['calculation_method'] unless json_hash['calculation_method'].nil?
      result['calculate_sdes'] = json_hash['calculate_sdes'] unless json_hash['calculate_sdes'].nil?
      result['fhir_measure'] = FHIR::Measure.transform_json(json_hash['fhir_measure']) unless json_hash['fhir_measure'].nil?
      result['libraries'] = json_hash['libraries'].map { |var| FHIR::Library.transform_json(var) } unless json_hash['libraries'].nil?
      result['value_sets'] = json_hash['value_sets'].map { |var| FHIR::ValueSet.transform_json(var) } unless json_hash['value_sets'].nil?
      result['cql_libraries'] = json_hash['cql_libraries'].map { |var| CQM::LogicLibrary.transform_json(var) } unless json_hash['cql_libraries'].nil?
      result['main_cql_library'] = json_hash['main_cql_library'] unless json_hash['main_cql_library'].nil?
      result['source_data_criteria'] = json_hash['source_data_criteria'].map { |var| CQM::DataElement.transform_json(var) } unless json_hash['source_data_criteria'].nil?
      result['population_sets'] = json_hash['population_sets'].map { |var| CQM::PopulationSet.transform_json(var) } unless json_hash['population_sets'].nil?
      result['measure_period'] = json_hash['measure_period'] unless json_hash['measure_period'].nil?
      result['created_at'] = json_hash['created_at'] unless json_hash['created_at'].nil?
      result['updated_at'] = json_hash['updated_at'] unless json_hash['updated_at'].nil?
      result
    end
  end

end
