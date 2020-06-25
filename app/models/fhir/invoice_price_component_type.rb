module FHIR
  # fhir/invoice_price_component_type.rb
  class InvoicePriceComponentType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'InvoicePriceComponentType'
    field :value, type: String

    def self.transform_json(json_hash)
      result = InvoicePriceComponentType.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
