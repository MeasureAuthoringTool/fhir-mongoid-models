module FHIR
  # fhir/biologically_derived_product_category.rb
  class BiologicallyDerivedProductCategory < Element
    include Mongoid::Document
    field :value, type: String

    def self.transform_json(json_hash, target = BiologicallyDerivedProductCategory.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
