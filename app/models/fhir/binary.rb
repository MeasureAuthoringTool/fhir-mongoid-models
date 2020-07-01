module FHIR
  # fhir/binary.rb
  class Binary < Resource
    include Mongoid::Document
    embeds_one :contentType, class_name: 'MimeType'
    embeds_one :securityContext, class_name: 'Reference'
    embeds_one :data, class_name: 'PrimitiveBase64Binary'

    def self.transform_json(json_hash, target = Binary.new)
      result = self.superclass.transform_json(json_hash, target)
      result['contentType'] = MimeType.transform_json(json_hash['contentType']) unless json_hash['contentType'].nil?      
      result['securityContext'] = Reference.transform_json(json_hash['securityContext']) unless json_hash['securityContext'].nil?      
      result['data'] = PrimitiveBase64Binary.transform_json(json_hash['data'], json_hash['_data']) unless json_hash['data'].nil?      

      result
    end
  end
end
