module FHIR
  # fhir/medication_request_substitution.rb
  class MedicationRequestSubstitution < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationRequestSubstitution'
    embeds_one :allowedBoolean, class_name: 'PrimitiveBoolean'
    embeds_one :allowedCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :reason, class_name: 'CodeableConcept'

    def self.transform_json(json_hash, target=MedicationRequestSubstitution.new)
      result = self.superclass.transform_json(json_hash, target)
      result['allowedBoolean'] = PrimitiveBoolean.transform_json(json_hash['allowedBoolean'], json_hash['_allowedBoolean']) unless json_hash['allowedBoolean'].nil?      
      result['allowedCodeableConcept'] = CodeableConcept.transform_json(json_hash['allowedCodeableConcept']) unless json_hash['allowedCodeableConcept'].nil?      
      result['reason'] = CodeableConcept.transform_json(json_hash['reason']) unless json_hash['reason'].nil?      

      result
    end
  end
end
