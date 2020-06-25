module FHIR
  # fhir/expression.rb
  class Expression < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'Expression'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_one :name, class_name: 'PrimitiveId'
    embeds_one :language, class_name: 'PrimitiveCode'
    embeds_one :expression, class_name: 'PrimitiveString'
    embeds_one :reference, class_name: 'PrimitiveUri'

    def self.transform_json(json_hash)
      result = Expression.new
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['name'] = PrimitiveId.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['language'] = PrimitiveCode.transform_json(json_hash['language'], json_hash['_language']) unless json_hash['language'].nil?      
      result['expression'] = PrimitiveString.transform_json(json_hash['expression'], json_hash['_expression']) unless json_hash['expression'].nil?      
      result['reference'] = PrimitiveUri.transform_json(json_hash['reference'], json_hash['_reference']) unless json_hash['reference'].nil?      

      result
    end
  end
end
