module FHIR
  # fhir/claim_care_team.rb
  class ClaimCareTeam < BackboneElement
    include Mongoid::Document
    embeds_one :sequence, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_one :provider, class_name: 'FHIR::Reference'    
    embeds_one :responsible, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :role, class_name: 'FHIR::CodeableConcept'    
    embeds_one :qualification, class_name: 'FHIR::CodeableConcept'    

    def self.transform_json(json_hash, target = ClaimCareTeam.new)
      result = self.superclass.transform_json(json_hash, target)
      result['sequence'] = PrimitivePositiveInt.transform_json(json_hash['sequence'], json_hash['_sequence']) unless json_hash['sequence'].nil?
      result['provider'] = Reference.transform_json(json_hash['provider']) unless json_hash['provider'].nil?
      result['responsible'] = PrimitiveBoolean.transform_json(json_hash['responsible'], json_hash['_responsible']) unless json_hash['responsible'].nil?
      result['role'] = CodeableConcept.transform_json(json_hash['role']) unless json_hash['role'].nil?
      result['qualification'] = CodeableConcept.transform_json(json_hash['qualification']) unless json_hash['qualification'].nil?

      result
    end
  end
end
