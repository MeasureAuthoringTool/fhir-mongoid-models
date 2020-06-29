module FHIR
  # fhir/primitive_base_64_binary.rb
  class PrimitiveBase64Binary < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'PrimitiveBase64Binary'
    field :value, type: String

    def self.transform_json(json_hash, extension_hash, target=PrimitiveBase64Binary.new)
      result = target
      unless extension_hash.nil?
        result['id'] = extension_hash['id']
        result['extension'] = extension_hash['extension'].map { |ext| Extension.transform_json(ext) }
      end
      result['value'] = json_hash
      result
    end
  end
end
