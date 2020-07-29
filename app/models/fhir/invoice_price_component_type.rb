module FHIR
  # fhir/invoice_price_component_type.rb
  class InvoicePriceComponentType < Element
    include Mongoid::Document
    field :value, type: String    

    def self.transform_json(json_hash, target = InvoicePriceComponentType.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
