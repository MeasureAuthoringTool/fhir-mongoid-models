module FHIR
  # fhir/structure_map_structure.rb
  class StructureMapStructure < BackboneElement
    include Mongoid::Document
    embeds_one :url, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_one :mode, class_name: 'FHIR::StructureMapModelMode'    
    embeds_one :alias, class_name: 'FHIR::PrimitiveString'    
    embeds_one :documentation, class_name: 'FHIR::PrimitiveString'    

    def self.transform_json(json_hash, target = StructureMapStructure.new)
      result = self.superclass.transform_json(json_hash, target)
      result['url'] = PrimitiveCanonical.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?
      result['mode'] = StructureMapModelMode.transform_json(json_hash['mode']) unless json_hash['mode'].nil?
      result['alias'] = PrimitiveString.transform_json(json_hash['alias'], json_hash['_alias']) unless json_hash['alias'].nil?
      result['documentation'] = PrimitiveString.transform_json(json_hash['documentation'], json_hash['_documentation']) unless json_hash['documentation'].nil?

      result
    end
  end
end
