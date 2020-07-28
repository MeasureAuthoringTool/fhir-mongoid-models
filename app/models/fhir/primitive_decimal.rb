module FHIR
  # fhir/primitive_decimal.rb
  class PrimitiveDecimal < Element
    include Mongoid::Document
    field :value, type: BigDecimal    

    def self.transform_json(json_hash, extension_hash, target = PrimitiveDecimal.new)
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
