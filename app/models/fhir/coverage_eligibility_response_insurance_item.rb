module FHIR
  # fhir/coverage_eligibility_response_insurance_item.rb
  class CoverageEligibilityResponseInsuranceItem < BackboneElement
    include Mongoid::Document
    embeds_one :category, class_name: 'FHIR::CodeableConcept'    
    embeds_one :productOrService, class_name: 'FHIR::CodeableConcept'    
    embeds_many :modifier, class_name: 'FHIR::CodeableConcept'    
    embeds_one :provider, class_name: 'FHIR::Reference'    
    embeds_one :excluded, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :network, class_name: 'FHIR::CodeableConcept'    
    embeds_one :unit, class_name: 'FHIR::CodeableConcept'    
    embeds_one :term, class_name: 'FHIR::CodeableConcept'    
    embeds_many :benefit, class_name: 'FHIR::CoverageEligibilityResponseInsuranceItemBenefit'    
    embeds_one :authorizationRequired, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_many :authorizationSupporting, class_name: 'FHIR::CodeableConcept'    
    embeds_one :authorizationUrl, class_name: 'FHIR::PrimitiveUri'    

    def self.transform_json(json_hash, target = CoverageEligibilityResponseInsuranceItem.new)
      result = self.superclass.transform_json(json_hash, target)
      result['category'] = CodeableConcept.transform_json(json_hash['category']) unless json_hash['category'].nil?
      result['productOrService'] = CodeableConcept.transform_json(json_hash['productOrService']) unless json_hash['productOrService'].nil?
      result['modifier'] = json_hash['modifier'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['modifier'].nil?
      result['provider'] = Reference.transform_json(json_hash['provider']) unless json_hash['provider'].nil?
      result['excluded'] = PrimitiveBoolean.transform_json(json_hash['excluded'], json_hash['_excluded']) unless json_hash['excluded'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['network'] = CodeableConcept.transform_json(json_hash['network']) unless json_hash['network'].nil?
      result['unit'] = CodeableConcept.transform_json(json_hash['unit']) unless json_hash['unit'].nil?
      result['term'] = CodeableConcept.transform_json(json_hash['term']) unless json_hash['term'].nil?
      result['benefit'] = json_hash['benefit'].map { |var| CoverageEligibilityResponseInsuranceItemBenefit.transform_json(var) } unless json_hash['benefit'].nil?
      result['authorizationRequired'] = PrimitiveBoolean.transform_json(json_hash['authorizationRequired'], json_hash['_authorizationRequired']) unless json_hash['authorizationRequired'].nil?
      result['authorizationSupporting'] = json_hash['authorizationSupporting'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['authorizationSupporting'].nil?
      result['authorizationUrl'] = PrimitiveUri.transform_json(json_hash['authorizationUrl'], json_hash['_authorizationUrl']) unless json_hash['authorizationUrl'].nil?

      result
    end
  end
end
