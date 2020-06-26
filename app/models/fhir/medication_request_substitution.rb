module FHIR
  # fhir/medication_request_substitution.rb
  class MedicationRequestSubstitution < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationRequestSubstitution'
    embeds_one :allowedboolean, class_name: 'PrimitiveBoolean'
    embeds_one :allowedCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :reason, class_name: 'CodeableConcept'

    def self.transform_json(json_hash)
      result = MedicationRequestSubstitution.new
      result['allowedboolean'] = PrimitiveBoolean.transform_json(json_hash['allowedboolean'], json_hash['_allowedboolean']) unless json_hash['allowedboolean'].nil?      
      result['allowedCodeableConcept'] = CodeableConcept.transform_json(json_hash['allowedCodeableConcept']) unless json_hash['allowedCodeableConcept'].nil?      
      result['reason'] = CodeableConcept.transform_json(json_hash['reason']) unless json_hash['reason'].nil?      

      result
    end
  end
end
