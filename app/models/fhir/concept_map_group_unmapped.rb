module FHIR
  # fhir/concept_map_group_unmapped.rb
  class ConceptMapGroupUnmapped < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ConceptMapGroupUnmapped'
    embeds_one :mode, class_name: 'ConceptMapGroupUnmappedMode'
    embeds_one :code, class_name: 'PrimitiveCode'
    embeds_one :display, class_name: 'PrimitiveString'
    embeds_one :url, class_name: 'PrimitiveCanonical'

    def self.transform_json(json_hash, target=ConceptMapGroupUnmapped.new)
      result = self.superclass.transform_json(json_hash, target)
      result['mode'] = ConceptMapGroupUnmappedMode.transform_json(json_hash['mode']) unless json_hash['mode'].nil?      
      result['code'] = PrimitiveCode.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?      
      result['display'] = PrimitiveString.transform_json(json_hash['display'], json_hash['_display']) unless json_hash['display'].nil?      
      result['url'] = PrimitiveCanonical.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?      

      result
    end
  end
end
