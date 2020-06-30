module FHIR
  # fhir/coverage_eligibility_request_supporting_info.rb
  class CoverageEligibilityRequestSupportingInfo < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CoverageEligibilityRequestSupportingInfo'
    embeds_one :sequence, class_name: 'PrimitivePositiveInt'
    embeds_one :information, class_name: 'Reference'
    embeds_one :appliesToAll, class_name: 'PrimitiveBoolean'

    def self.transform_json(json_hash, target=CoverageEligibilityRequestSupportingInfo.new)
      result = self.superclass.transform_json(json_hash, target)
      result['sequence'] = PrimitivePositiveInt.transform_json(json_hash['sequence'], json_hash['_sequence']) unless json_hash['sequence'].nil?      
      result['information'] = Reference.transform_json(json_hash['information']) unless json_hash['information'].nil?      
      result['appliesToAll'] = PrimitiveBoolean.transform_json(json_hash['appliesToAll'], json_hash['_appliesToAll']) unless json_hash['appliesToAll'].nil?      

      result
    end
  end
end
