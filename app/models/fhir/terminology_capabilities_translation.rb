module FHIR
  # fhir/terminology_capabilities_translation.rb
  class TerminologyCapabilitiesTranslation < BackboneElement
    include Mongoid::Document
    embeds_one :needsMap, class_name: 'FHIR::PrimitiveBoolean'

    def self.transform_json(json_hash, target = TerminologyCapabilitiesTranslation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['needsMap'] = PrimitiveBoolean.transform_json(json_hash['needsMap'], json_hash['_needsMap']) unless json_hash['needsMap'].nil?      

      result
    end
  end
end
