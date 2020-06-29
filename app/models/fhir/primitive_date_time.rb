module FHIR
  # fhir/primitive_date_time.rb
  class PrimitiveDateTime < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'PrimitiveDateTime'
    field :value, type: DateTime

    def self.transform_json(json_hash, extension_hash, target=PrimitiveDateTime.new)
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
