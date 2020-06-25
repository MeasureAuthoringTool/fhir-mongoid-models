module FHIR
  # fhir/primitive_date.rb
  class PrimitiveDate < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'PrimitiveDate'
    field :value, type: Date

    def self.transform_json(json_hash, extension_hash)
      result = PrimitiveDate.new
      unless extension_hash.nil?
        result['id'] = extension_hash['id']
        result['extension'] = extension_hash['extension'].map { |ext| Extension.transform_json(ext) }
      end
      result['value'] = json_hash
      result
    end
  end
end
