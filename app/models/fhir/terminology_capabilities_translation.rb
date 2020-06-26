module FHIR
  # fhir/terminology_capabilities_translation.rb
  class TerminologyCapabilitiesTranslation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TerminologyCapabilitiesTranslation'
    embeds_one :needsMap, class_name: 'PrimitiveBoolean'

    def self.transform_json(json_hash)
      result = TerminologyCapabilitiesTranslation.new
      result['needsMap'] = PrimitiveBoolean.transform_json(json_hash['needsMap'], json_hash['_needsMap']) unless json_hash['needsMap'].nil?      

      result
    end
  end
end
