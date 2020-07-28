module FHIR
  # fhir/medicinal_product_authorization_jurisdictional_authorization.rb
  class MedicinalProductAuthorizationJurisdictionalAuthorization < BackboneElement
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :country, class_name: 'FHIR::CodeableConcept'    
    embeds_many :jurisdiction, class_name: 'FHIR::CodeableConcept'    
    embeds_one :legalStatusOfSupply, class_name: 'FHIR::CodeableConcept'    
    embeds_one :validityPeriod, class_name: 'FHIR::Period'    

    def self.transform_json(json_hash, target = MedicinalProductAuthorizationJurisdictionalAuthorization.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['country'] = CodeableConcept.transform_json(json_hash['country']) unless json_hash['country'].nil?
      result['jurisdiction'] = json_hash['jurisdiction'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['jurisdiction'].nil?
      result['legalStatusOfSupply'] = CodeableConcept.transform_json(json_hash['legalStatusOfSupply']) unless json_hash['legalStatusOfSupply'].nil?
      result['validityPeriod'] = Period.transform_json(json_hash['validityPeriod']) unless json_hash['validityPeriod'].nil?

      result
    end
  end
end
