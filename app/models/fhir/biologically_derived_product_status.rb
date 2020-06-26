module FHIR
  # fhir/biologically_derived_product_status.rb
  class BiologicallyDerivedProductStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'BiologicallyDerivedProductStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = BiologicallyDerivedProductStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
