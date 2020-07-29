module FHIR
  # fhir/structure_map_group_input.rb
  class StructureMapGroupInput < BackboneElement
    include Mongoid::Document
    embeds_one :name, class_name: 'FHIR::PrimitiveId'    
    embeds_one :type, class_name: 'FHIR::PrimitiveString'    
    embeds_one :mode, class_name: 'FHIR::StructureMapInputMode'    
    embeds_one :documentation, class_name: 'FHIR::PrimitiveString'    

    def self.transform_json(json_hash, target = StructureMapGroupInput.new)
      result = self.superclass.transform_json(json_hash, target)
      result['name'] = PrimitiveId.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['type'] = PrimitiveString.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['mode'] = StructureMapInputMode.transform_json(json_hash['mode']) unless json_hash['mode'].nil?
      result['documentation'] = PrimitiveString.transform_json(json_hash['documentation'], json_hash['_documentation']) unless json_hash['documentation'].nil?

      result
    end
  end
end
