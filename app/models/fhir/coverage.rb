module FHIR
  # fhir/coverage.rb
  class Coverage < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'CoverageStatus'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :policyHolder, class_name: 'Reference'
    embeds_one :subscriber, class_name: 'Reference'
    embeds_one :subscriberId, class_name: 'PrimitiveString'
    embeds_one :beneficiary, class_name: 'Reference'
    embeds_one :dependent, class_name: 'PrimitiveString'
    embeds_one :relationship, class_name: 'CodeableConcept'
    embeds_one :period, class_name: 'Period'
    embeds_many :payor, class_name: 'Reference'
    embeds_many :class, class_name: 'CoverageClass'
    embeds_one :order, class_name: 'PrimitivePositiveInt'
    embeds_one :network, class_name: 'PrimitiveString'
    embeds_many :costToBeneficiary, class_name: 'CoverageCostToBeneficiary'
    embeds_one :subrogation, class_name: 'PrimitiveBoolean'
    embeds_many :contract, class_name: 'Reference'

    def self.transform_json(json_hash, target = Coverage.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = CoverageStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['policyHolder'] = Reference.transform_json(json_hash['policyHolder']) unless json_hash['policyHolder'].nil?      
      result['subscriber'] = Reference.transform_json(json_hash['subscriber']) unless json_hash['subscriber'].nil?      
      result['subscriberId'] = PrimitiveString.transform_json(json_hash['subscriberId'], json_hash['_subscriberId']) unless json_hash['subscriberId'].nil?      
      result['beneficiary'] = Reference.transform_json(json_hash['beneficiary']) unless json_hash['beneficiary'].nil?      
      result['dependent'] = PrimitiveString.transform_json(json_hash['dependent'], json_hash['_dependent']) unless json_hash['dependent'].nil?      
      result['relationship'] = CodeableConcept.transform_json(json_hash['relationship']) unless json_hash['relationship'].nil?      
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?      
      result['payor'] = json_hash['payor'].map { |var| Reference.transform_json(var) } unless json_hash['payor'].nil?
      result['class'] = json_hash['class'].map { |var| CoverageClass.transform_json(var) } unless json_hash['class'].nil?
      result['order'] = PrimitivePositiveInt.transform_json(json_hash['order'], json_hash['_order']) unless json_hash['order'].nil?      
      result['network'] = PrimitiveString.transform_json(json_hash['network'], json_hash['_network']) unless json_hash['network'].nil?      
      result['costToBeneficiary'] = json_hash['costToBeneficiary'].map { |var| CoverageCostToBeneficiary.transform_json(var) } unless json_hash['costToBeneficiary'].nil?
      result['subrogation'] = PrimitiveBoolean.transform_json(json_hash['subrogation'], json_hash['_subrogation']) unless json_hash['subrogation'].nil?      
      result['contract'] = json_hash['contract'].map { |var| Reference.transform_json(var) } unless json_hash['contract'].nil?

      result
    end
  end
end
