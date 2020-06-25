module FHIR
  # fhir/concept_map_group_element.rb
  class ConceptMapGroupElement < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ConceptMapGroupElement'
    embeds_one :code, class_name: 'PrimitiveCode'
    embeds_one :display, class_name: 'PrimitiveString'
    embeds_many :target, class_name: 'ConceptMapGroupElementTarget'

    def self.transform_json(json_hash)
      result = ConceptMapGroupElement.new
      result['code'] = PrimitiveCode.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?      
      result['display'] = PrimitiveString.transform_json(json_hash['display'], json_hash['_display']) unless json_hash['display'].nil?      
      result['target'] = json_hash['target'].map { |var| ConceptMapGroupElementTarget.transform_json(var) } unless json_hash['target'].nil?

      result
    end
  end
end
