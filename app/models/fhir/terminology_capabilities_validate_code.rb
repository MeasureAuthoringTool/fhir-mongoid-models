module FHIR
  # fhir/terminology_capabilities_validate_code.rb
  class TerminologyCapabilitiesValidateCode < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TerminologyCapabilitiesValidateCode'
    embeds_one :translations, class_name: 'PrimitiveBoolean'

    def self.transform_json(json_hash)
      result = TerminologyCapabilitiesValidateCode.new
      result['translations'] = PrimitiveBoolean.transform_json(json_hash['translations'], json_hash['_translations']) unless json_hash['translations'].nil?      

      result
    end
  end
end
