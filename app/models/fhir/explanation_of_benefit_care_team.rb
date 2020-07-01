module FHIR
  # fhir/explanation_of_benefit_care_team.rb
  class ExplanationOfBenefitCareTeam < BackboneElement
    include Mongoid::Document
    embeds_one :sequence, class_name: 'PrimitivePositiveInt'
    embeds_one :provider, class_name: 'Reference'
    embeds_one :responsible, class_name: 'PrimitiveBoolean'
    embeds_one :role, class_name: 'CodeableConcept'
    embeds_one :qualification, class_name: 'CodeableConcept'

    def self.transform_json(json_hash, target = ExplanationOfBenefitCareTeam.new)
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
