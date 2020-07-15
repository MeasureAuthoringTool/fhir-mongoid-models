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

    # A version-specific UUID for the measure
    field :set_id, type: String
    field :calculation_method, type: String, default: 'PATIENT'
    field :calculate_sdes, type: Boolean

    embeds_one :fhir_measure, class_name: 'FHIR::Measure'
    embeds_many :libraries, class_name: 'FHIR::Library'
    has_and_belongs_to_many :value_sets, class_name: 'CQM::ValueSet', inverse_of: nil
    has_one :package, class_name: 'CQM::MeasurePackage', inverse_of: :measure, dependent: :destroy

    # ELM/CQL Measure-logic related data
    # Field name changed from 'cql' to 'cql_libraries' because the semantics of
    # 'embeds_many :cqls' sounded weird
    embeds_many :cql_libraries, class_name: 'CQM::LogicLibrary'
    field :main_cql_library, type: String
  end
end
