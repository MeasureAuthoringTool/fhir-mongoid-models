module FHIR
  # fhir/primitive_boolean.rb
  class PrimitiveBoolean < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'PrimitiveBoolean'
    field :value, type: Boolean

    def self.transform_json(json_hash, extension_hash)
      result = PrimitiveBoolean.new
      unless extension_hash.nil?
        result['id'] = extension_hash['id']
        result['extension'] = extension_hash['extension'].map { |ext| Extension.transform_json(ext) }
      end
      result['value'] = json_hash
      result
    end
  end
end
