module FHIR
  # fhir/biologically_derived_product_status.rb
  class BiologicallyDerivedProductStatus < Element
    include Mongoid::Document
    field :value, type: String    

    def self.transform_json(json_hash, target = BiologicallyDerivedProductStatus.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
