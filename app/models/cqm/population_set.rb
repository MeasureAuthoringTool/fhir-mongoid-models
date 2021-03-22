module CQM
  # Representation of a population set (aka. PopulationCriteria)
  class PopulationSet
    include Mongoid::Document

    embedded_in :measure

    embeds_one :populations, class_name: 'CQM::PopulationMap'
    embeds_many :stratifications
    embeds_many :supplemental_data_elements, class_name: 'CQM::StatementReference'
    embeds_many :observations

    field :title, type: String
    field :population_set_id, type: String

    def as_json(*args)
      result = Hash.new
      unless self.populations.nil?
        result['populations'] = self.populations.as_json(args)
      end
      unless self.stratifications.nil?  || !self.stratifications.any?
        result['stratifications'] = self.stratifications.map{ |x| x.as_json(*args) }
      end
      unless self.supplemental_data_elements.nil?  || !self.supplemental_data_elements.any?
        result['supplemental_data_elements'] = self.supplemental_data_elements.map{ |x| x.as_json(*args) }
      end
      unless self.observations.nil?  || !self.observations.any?
        result['observations'] = self.observations.map{ |x| x.as_json(*args) }
      end
      unless self.title.nil?
        result['title'] = self.title
      end
      unless self.population_set_id.nil?
        result['population_set_id'] = self.population_set_id
      end

      result
    end

    def self.transform_json(json_hash, target = PopulationSet.new)
      result = target
      result['populations'] = CQM::PopulationMap.transform_json(json_hash['populations']) unless json_hash['populations'].nil?
      result['stratifications'] = json_hash['stratifications'].map { |var| CQM::Stratification.transform_json(var) } unless json_hash['stratifications'].nil?
      result['supplemental_data_elements'] = json_hash['supplemental_data_elements'].map { |var| CQM::StatementReference.transform_json(var) } unless json_hash['supplemental_data_elements'].nil?
      result['observations'] = json_hash['observations'].map { |var| CQM::Observation.transform_json(var) } unless json_hash['observations'].nil?
      result['title'] = json_hash['title'] unless json_hash['title'].nil?
      result['population_set_id'] = json_hash['population_set_id'] unless json_hash['population_set_id'].nil?

      result
    end
  end

  # Stratification info
  class Stratification
    include Mongoid::Document

    embedded_in :population_set

    field :title, type: String
    field :stratification_id, type: String
    embeds_one :statement, class_name: 'CQM::StatementReference'

    def as_json(*args)
      result = Hash.new
      unless self.title.nil?
        result['title'] = self.title
      end
      unless self.stratification_id.nil?
        result['stratification_id'] = self.stratification_id
      end
      unless self.statement.nil?
        result['statement'] = self.statement.as_json(args)
      end

      result
    end

    def self.transform_json(json_hash, target = Stratification.new)
      result = target
      result['title'] = json_hash['title'] unless json_hash['title'].nil?
      result['stratification_id'] = json_hash['stratification_id'] unless json_hash['stratification_id'].nil?
      result['statement'] = CQM::StatementReference.transform_json(json_hash['statement']) unless json_hash['statement'].nil?

      result
    end
  end

  # Observation info
  class Observation
    include Mongoid::Document

    embedded_in :population_set

    # observationPopulation.criteria
    embeds_one :observation_function, class_name: 'CQM::StatementReference'

    # Observation Identifier, observationPopulation.extension.[url]/cqfm-criteriaReference
    embeds_one :observation_parameter, class_name: 'CQM::StatementReference'

    # Aggregate Method (aka Aggregate Type), observationPopulation.extension.[url]/cqfm-aggregateMethod
    field :aggregation_type, type: String

    def as_json(*args)
      result = Hash.new
      unless self.observation_function.nil?
        result['observation_function'] = self.observation_function.as_json(args)
      end
      unless self.observation_parameter.nil?
        result['observation_parameter'] = self.observation_parameter.as_json(args)
      end
      unless self.aggregation_type.nil?
        result['aggregation_type'] = self.aggregation_type
      end

      result
    end

    def self.transform_json(json_hash, target = Observation.new)
      result = target
      result['observation_function'] = CQM::StatementReference.transform_json(json_hash['observation_function']) unless json_hash['observation_function'].nil?
      result['observation_parameter'] = CQM::StatementReference.transform_json(json_hash['observation_parameter']) unless json_hash['observation_parameter'].nil?
      result['aggregation_type'] = json_hash['aggregation_type'] unless json_hash['aggregation_type'].nil?

      result
    end
  end

  # Base class for the population maps
  class PopulationMap
    include Mongoid::Document

    embedded_in :population_set
    field :resource_type, type: String

    def as_json(*args)
      result = Hash.new
      result['resource_type'] = 'PopulationMap'
      result
    end

    def self.transform_json(json_hash, target = PopulationMap.new)
      if 'PopulationMap' != json_hash['resource_type']
        return Object.const_get('CQM::' + json_hash['resource_type']).transform_json(json_hash)
      end
      result = target
      result['resource_type'] = 'PopulationMap'
      result
    end

  end

  # The population map for a porportion population set
  class ProportionPopulationMap < PopulationMap
    include Mongoid::Document

    embeds_one :IPP, class_name: 'CQM::StatementReference'
    embeds_one :DENOM, class_name: 'CQM::StatementReference'
    embeds_one :NUMER, class_name: 'CQM::StatementReference'
    embeds_one :NUMEX, class_name: 'CQM::StatementReference'
    embeds_one :DENEX, class_name: 'CQM::StatementReference'
    embeds_one :DENEXCEP, class_name: 'CQM::StatementReference'

    def as_json(*args)
      result = Hash.new
      result['resource_type'] = 'ProportionPopulationMap'
      unless self.IPP.nil?
        result['IPP'] = self.IPP.as_json(args)
      end
      unless self.DENOM.nil?
        result['DENOM'] = self.DENOM.as_json(args)
      end
      unless self.NUMER.nil?
        result['NUMER'] = self.NUMER.as_json(args)
      end
      unless self.NUMEX.nil?
        result['NUMEX'] = self.NUMEX.as_json(args)
      end
      unless self.DENEX.nil?
        result['DENEX'] = self.DENEX.as_json(args)
      end
      unless self.DENEXCEP.nil?
        result['DENEXCEP'] = self.DENEXCEP.as_json(args)
      end

      result
    end

    def self.transform_json(json_hash, target = ProportionPopulationMap.new)
      result = target
      result['resource_type'] = 'ProportionPopulationMap'
      result['IPP'] = CQM::StatementReference.transform_json(json_hash['IPP']) unless json_hash['IPP'].nil?
      result['DENOM'] = CQM::StatementReference.transform_json(json_hash['DENOM']) unless json_hash['DENOM'].nil?
      result['NUMER'] = CQM::StatementReference.transform_json(json_hash['NUMER']) unless json_hash['NUMER'].nil?
      result['NUMEX'] = CQM::StatementReference.transform_json(json_hash['NUMEX']) unless json_hash['NUMEX'].nil?
      result['DENEX'] = CQM::StatementReference.transform_json(json_hash['DENEX']) unless json_hash['DENEX'].nil?
      result['DENEXCEP'] = CQM::StatementReference.transform_json(json_hash['DENEXCEP']) unless json_hash['DENEXCEP'].nil?

      result
    end
  end

  # The population map for a ratio population set
  class RatioPopulationMap < PopulationMap
    include Mongoid::Document

    embeds_one :IPP, class_name: 'CQM::StatementReference'
    embeds_one :DENOM, class_name: 'CQM::StatementReference'
    embeds_one :NUMER, class_name: 'CQM::StatementReference'
    embeds_one :NUMEX, class_name: 'CQM::StatementReference'
    embeds_one :DENEX, class_name: 'CQM::StatementReference'

    def as_json(*args)
      result = Hash.new
      result['resource_type'] = 'RatioPopulationMap'
      unless self.IPP.nil?
        result['IPP'] = self.IPP.as_json(args)
      end
      unless self.DENOM.nil?
        result['DENOM'] = self.DENOM.as_json(args)
      end
      unless self.NUMER.nil?
        result['NUMER'] = self.NUMER.as_json(args)
      end
      unless self.NUMEX.nil?
        result['NUMEX'] = self.NUMEX.as_json(args)
      end
      unless self.DENEX.nil?
        result['DENEX'] = self.DENEX.as_json(args)
      end

      result
    end

    def self.transform_json(json_hash, target = RatioPopulationMap.new)
      result = target
      result['resource_type'] = 'RatioPopulationMap'
      result['IPP'] = CQM::StatementReference.transform_json(json_hash['IPP']) unless json_hash['IPP'].nil?
      result['DENOM'] = CQM::StatementReference.transform_json(json_hash['DENOM']) unless json_hash['DENOM'].nil?
      result['NUMER'] = CQM::StatementReference.transform_json(json_hash['NUMER']) unless json_hash['NUMER'].nil?
      result['NUMEX'] = CQM::StatementReference.transform_json(json_hash['NUMEX']) unless json_hash['NUMEX'].nil?
      result['DENEX'] = CQM::StatementReference.transform_json(json_hash['DENEX']) unless json_hash['DENEX'].nil?

      result
    end
  end

  # The population map for a continuous variable population set
  class ContinuousVariablePopulationMap < PopulationMap
    include Mongoid::Document

    embeds_one :IPP, class_name: 'CQM::StatementReference'
    embeds_one :MSRPOPL, class_name: 'CQM::StatementReference'
    embeds_one :MSRPOPLEX, class_name: 'CQM::StatementReference'

    def as_json(*args)
      result = Hash.new
      result['resource_type'] = 'ContinuousVariablePopulationMap'
      unless self.IPP.nil?
        result['IPP'] = self.IPP.as_json(args)
      end
      unless self.MSRPOPL.nil?
        result['MSRPOPL'] = self.MSRPOPL.as_json(args)
      end
      unless self.MSRPOPLEX.nil?
        result['MSRPOPLEX'] = self.MSRPOPLEX.as_json(args)
      end

      result
    end

    def self.transform_json(json_hash, target = ContinuousVariablePopulationMap.new)
      result = target
      result['resource_type'] = 'ContinuousVariablePopulationMap'
      result['IPP'] = CQM::StatementReference.transform_json(json_hash['IPP']) unless json_hash['IPP'].nil?
      result['MSRPOPL'] = CQM::StatementReference.transform_json(json_hash['MSRPOPL']) unless json_hash['MSRPOPL'].nil?
      result['MSRPOPLEX'] = CQM::StatementReference.transform_json(json_hash['MSRPOPLEX']) unless json_hash['MSRPOPLEX'].nil?

      result
    end
  end

  # The population map for a cohort population set
  class CohortPopulationMap < PopulationMap
    include Mongoid::Document

    embeds_one :IPP, class_name: 'CQM::StatementReference'

    def as_json(*args)
      result = Hash.new
      result['resource_type'] = 'CohortPopulationMap'
      unless self.IPP.nil?
        result['IPP'] = self.IPP.as_json(args)
      end

      result
    end

    def self.transform_json(json_hash, target = CohortPopulationMap.new)
      result = target
      result['resource_type'] = 'CohortPopulationMap'
      result['IPP'] = CQM::StatementReference.transform_json(json_hash['IPP']) unless json_hash['IPP'].nil?

      result
    end
  end
end
