module FHIR
  # fhir/biologically_derived_product_category.rb
  class BiologicallyDerivedProductCategory < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'BiologicallyDerivedProductCategory'
    field :value, type: String

    def self.transform_json(json_hash)
      result = BiologicallyDerivedProductCategory.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
