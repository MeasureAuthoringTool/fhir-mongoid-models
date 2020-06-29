module FHIR
  # fhir/terminology_capabilities_closure.rb
  class TerminologyCapabilitiesClosure < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TerminologyCapabilitiesClosure'
    embeds_one :translation, class_name: 'PrimitiveBoolean'

    def self.transform_json(json_hash, target=TerminologyCapabilitiesClosure.new)
      result = self.superclass.transform_json(json_hash, target)
      result['translation'] = PrimitiveBoolean.transform_json(json_hash['translation'], json_hash['_translation']) unless json_hash['translation'].nil?      

      result
    end
  end
end
