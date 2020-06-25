module FHIR
  # fhir/primitive_unsigned_int.rb
  class PrimitiveUnsignedInt < PrimitiveInteger
    include Mongoid::Document
    field :typeName, type: String, default: 'PrimitiveUnsignedInt'

    def self.transform_json(json_hash, extension_hash)
      result = PrimitiveUnsignedInt.new
      unless extension_hash.nil?
        result['id'] = extension_hash['id']
        result['extension'] = extension_hash['extension'].map { |ext| Extension.transform_json(ext) }
      end
      result['value'] = json_hash
      result
    end
  end
end
