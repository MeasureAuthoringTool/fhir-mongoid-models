module FHIR
  # fhir/terminology_capabilities_expansion_parameter.rb
  class TerminologyCapabilitiesExpansionParameter < BackboneElement
    include Mongoid::Document
    embeds_one :name, class_name: 'FHIR::PrimitiveCode'
    embeds_one :documentation, class_name: 'FHIR::PrimitiveString'

    def self.transform_json(json_hash, target = TerminologyCapabilitiesExpansionParameter.new)
      result = self.superclass.transform_json(json_hash, target)
      result['name'] = PrimitiveCode.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['documentation'] = PrimitiveString.transform_json(json_hash['documentation'], json_hash['_documentation']) unless json_hash['documentation'].nil?      

      result
    end
  end
end
