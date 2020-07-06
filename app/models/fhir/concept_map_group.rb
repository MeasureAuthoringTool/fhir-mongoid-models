module FHIR
  # fhir/concept_map_group.rb
  class ConceptMapGroup < BackboneElement
    include Mongoid::Document
    embeds_one :source, class_name: 'PrimitiveUri'
    embeds_one :sourceVersion, class_name: 'PrimitiveString'
    embeds_one :target, class_name: 'PrimitiveUri'
    embeds_one :targetVersion, class_name: 'PrimitiveString'
    embeds_many :element, class_name: 'ConceptMapGroupElement'
    embeds_one :unmapped, class_name: 'ConceptMapGroupUnmapped'

    def self.transform_json(json_hash, target = ConceptMapGroup.new)
      result = self.superclass.transform_json(json_hash, target)
      result['source'] = PrimitiveUri.transform_json(json_hash['source'], json_hash['_source']) unless json_hash['source'].nil?      
      result['sourceVersion'] = PrimitiveString.transform_json(json_hash['sourceVersion'], json_hash['_sourceVersion']) unless json_hash['sourceVersion'].nil?      
      result['target'] = PrimitiveUri.transform_json(json_hash['target'], json_hash['_target']) unless json_hash['target'].nil?      
      result['targetVersion'] = PrimitiveString.transform_json(json_hash['targetVersion'], json_hash['_targetVersion']) unless json_hash['targetVersion'].nil?      
      result['element'] = json_hash['element'].map { |var| ConceptMapGroupElement.transform_json(var) } unless json_hash['element'].nil?
      result['unmapped'] = ConceptMapGroupUnmapped.transform_json(json_hash['unmapped']) unless json_hash['unmapped'].nil?      

      result
    end
  end
end
