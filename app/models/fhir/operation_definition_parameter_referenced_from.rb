module FHIR
  # fhir/operation_definition_parameter_referenced_from.rb
  class OperationDefinitionParameterReferencedFrom < BackboneElement
    include Mongoid::Document
    embeds_one :source, class_name: 'FHIR::PrimitiveString'
    embeds_one :sourceId, class_name: 'FHIR::PrimitiveString'

    def self.transform_json(json_hash, target = OperationDefinitionParameterReferencedFrom.new)
      result = self.superclass.transform_json(json_hash, target)
      result['source'] = PrimitiveString.transform_json(json_hash['source'], json_hash['_source']) unless json_hash['source'].nil?      
      result['sourceId'] = PrimitiveString.transform_json(json_hash['sourceId'], json_hash['_sourceId']) unless json_hash['sourceId'].nil?      

      result
    end
  end
end
