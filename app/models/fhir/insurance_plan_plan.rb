module FHIR
  # fhir/insurance_plan_plan.rb
  class InsurancePlanPlan < BackboneElement
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'
    embeds_one :type, class_name: 'FHIR::CodeableConcept'
    embeds_many :coverageArea, class_name: 'FHIR::Reference'
    embeds_many :network, class_name: 'FHIR::Reference'
    embeds_many :generalCost, class_name: 'FHIR::InsurancePlanPlanGeneralCost'
    embeds_many :specificCost, class_name: 'FHIR::InsurancePlanPlanSpecificCost'

    def self.transform_json(json_hash, target = InsurancePlanPlan.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['coverageArea'] = json_hash['coverageArea'].map { |var| Reference.transform_json(var) } unless json_hash['coverageArea'].nil?
      result['network'] = json_hash['network'].map { |var| Reference.transform_json(var) } unless json_hash['network'].nil?
      result['generalCost'] = json_hash['generalCost'].map { |var| InsurancePlanPlanGeneralCost.transform_json(var) } unless json_hash['generalCost'].nil?
      result['specificCost'] = json_hash['specificCost'].map { |var| InsurancePlanPlanSpecificCost.transform_json(var) } unless json_hash['specificCost'].nil?

      result
    end
  end
end
