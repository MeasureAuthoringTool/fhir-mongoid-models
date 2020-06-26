module FHIR
  # fhir/healthcare_service_eligibility.rb
  class HealthcareServiceEligibility < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'HealthcareServiceEligibility'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :comment, class_name: 'PrimitiveMarkdown'

    def self.transform_json(json_hash)
      result = HealthcareServiceEligibility.new
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['comment'] = PrimitiveMarkdown.transform_json(json_hash['comment'], json_hash['_comment']) unless json_hash['comment'].nil?      

      result
    end
  end
end
