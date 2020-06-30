module FHIR
  # fhir/signature.rb
  class Signature < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'Signature'
    embeds_many :type, class_name: 'Coding'
    embeds_one :when, class_name: 'PrimitiveInstant'
    embeds_one :who, class_name: 'Reference'
    embeds_one :onBehalfOf, class_name: 'Reference'
    embeds_one :targetFormat, class_name: 'MimeType'
    embeds_one :sigFormat, class_name: 'MimeType'
    embeds_one :data, class_name: 'PrimitiveBase64Binary'

    def self.transform_json(json_hash, target=Signature.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = json_hash['type'].map { |var| Coding.transform_json(var) } unless json_hash['type'].nil?
      result['when'] = PrimitiveInstant.transform_json(json_hash['when'], json_hash['_when']) unless json_hash['when'].nil?      
      result['who'] = Reference.transform_json(json_hash['who']) unless json_hash['who'].nil?      
      result['onBehalfOf'] = Reference.transform_json(json_hash['onBehalfOf']) unless json_hash['onBehalfOf'].nil?      
      result['targetFormat'] = MimeType.transform_json(json_hash['targetFormat']) unless json_hash['targetFormat'].nil?      
      result['sigFormat'] = MimeType.transform_json(json_hash['sigFormat']) unless json_hash['sigFormat'].nil?      
      result['data'] = PrimitiveBase64Binary.transform_json(json_hash['data'], json_hash['_data']) unless json_hash['data'].nil?      

      result
    end
  end
end
