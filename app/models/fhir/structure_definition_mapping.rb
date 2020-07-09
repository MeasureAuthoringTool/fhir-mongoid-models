module FHIR
  # fhir/structure_definition_mapping.rb
  class StructureDefinitionMapping < BackboneElement
    include Mongoid::Document
    embeds_one :identity, class_name: 'FHIR::PrimitiveId'
    embeds_one :uri, class_name: 'FHIR::PrimitiveUri'
    embeds_one :name, class_name: 'FHIR::PrimitiveString'
    embeds_one :comment, class_name: 'FHIR::PrimitiveString'

    def self.transform_json(json_hash, target = StructureDefinitionMapping.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identity'] = PrimitiveId.transform_json(json_hash['identity'], json_hash['_identity']) unless json_hash['identity'].nil?      
      result['uri'] = PrimitiveUri.transform_json(json_hash['uri'], json_hash['_uri']) unless json_hash['uri'].nil?      
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['comment'] = PrimitiveString.transform_json(json_hash['comment'], json_hash['_comment']) unless json_hash['comment'].nil?      

      result
    end
  end
end
