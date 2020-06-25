module FHIR
  # fhir/graph_definition_link.rb
  class GraphDefinitionLink < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'GraphDefinitionLink'
    embeds_one :path, class_name: 'PrimitiveString'
    embeds_one :sliceName, class_name: 'PrimitiveString'
    embeds_one :min, class_name: 'PrimitiveInteger'
    embeds_one :max, class_name: 'PrimitiveString'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_many :target, class_name: 'GraphDefinitionLinkTarget'

    def self.transform_json(json_hash)
      result = GraphDefinitionLink.new
      result['path'] = PrimitiveString.transform_json(json_hash['path'], json_hash['_path']) unless json_hash['path'].nil?      
      result['sliceName'] = PrimitiveString.transform_json(json_hash['sliceName'], json_hash['_sliceName']) unless json_hash['sliceName'].nil?      
      result['min'] = PrimitiveInteger.transform_json(json_hash['min'], json_hash['_min']) unless json_hash['min'].nil?      
      result['max'] = PrimitiveString.transform_json(json_hash['max'], json_hash['_max']) unless json_hash['max'].nil?      
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['target'] = json_hash['target'].map { |var| GraphDefinitionLinkTarget.transform_json(var) } unless json_hash['target'].nil?

      result
    end
  end
end
