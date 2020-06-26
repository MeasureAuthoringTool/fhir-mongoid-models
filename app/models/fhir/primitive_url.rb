module FHIR
  # fhir/primitive_url.rb
  class PrimitiveUrl < PrimitiveUri
    include Mongoid::Document
    field :typeName, type: String, default: 'PrimitiveUrl'

    def self.transform_json(json_hash, extension_hash)
      result = PrimitiveUrl.new
      unless extension_hash.nil?
        result['id'] = extension_hash['id']
        result['extension'] = extension_hash['extension'].map { |ext| Extension.transform_json(ext) }
      end
      result['value'] = json_hash
      result
    end
  end
end
