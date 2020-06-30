module FHIR
  # fhir/biologically_derived_product_storage_scale.rb
  class BiologicallyDerivedProductStorageScale < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'BiologicallyDerivedProductStorageScale'
    field :value, type: String

    def self.transform_json(json_hash, target=BiologicallyDerivedProductStorageScale.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
