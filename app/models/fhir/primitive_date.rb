module FHIR
  # fhir/primitive_date.rb
  class PrimitiveDate < Element
    include Mongoid::Document
    field :value, type: Date

    def self.transform_json(json_hash, extension_hash, target = PrimitiveDate.new)
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
