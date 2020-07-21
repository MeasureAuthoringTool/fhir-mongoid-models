module FHIR
  # fhir/primitive_boolean.rb
  class PrimitiveBoolean < Element
    include Mongoid::Document
    field :value, type: Boolean

    def self.transform_json(json_hash, extension_hash, target = PrimitiveBoolean.new)
      result = target
      unless extension_hash.nil?
        result['fhirId'] = extension_hash['id']
        result['extension'] = extension_hash['extension'].map { |ext| Extension.transform_json(ext) }
      end
      result['value'] = json_hash
      result
    end
  end
end
