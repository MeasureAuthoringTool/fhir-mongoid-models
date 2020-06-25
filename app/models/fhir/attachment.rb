module FHIR
  # fhir/attachment.rb
  class Attachment < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'Attachment'
    embeds_one :contentType, class_name: 'MimeType'
    embeds_one :language, class_name: 'PrimitiveCode'
    embeds_one :data, class_name: 'PrimitiveBase64Binary'
    embeds_one :url, class_name: 'PrimitiveUrl'
    embeds_one :size, class_name: 'PrimitiveUnsignedInt'
    embeds_one :hash, class_name: 'PrimitiveBase64Binary'
    embeds_one :title, class_name: 'PrimitiveString'
    embeds_one :creation, class_name: 'PrimitiveDateTime'

    def self.transform_json(json_hash)
      result = Attachment.new
      result['contentType'] = MimeType.transform_json(json_hash['contentType']) unless json_hash['contentType'].nil?      
      result['language'] = PrimitiveCode.transform_json(json_hash['language'], json_hash['_language']) unless json_hash['language'].nil?      
      result['data'] = PrimitiveBase64Binary.transform_json(json_hash['data'], json_hash['_data']) unless json_hash['data'].nil?      
      result['url'] = PrimitiveUrl.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?      
      result['size'] = PrimitiveUnsignedInt.transform_json(json_hash['size'], json_hash['_size']) unless json_hash['size'].nil?      
      result['hash'] = PrimitiveBase64Binary.transform_json(json_hash['hash'], json_hash['_hash']) unless json_hash['hash'].nil?      
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?      
      result['creation'] = PrimitiveDateTime.transform_json(json_hash['creation'], json_hash['_creation']) unless json_hash['creation'].nil?      

      result
    end
  end
end
