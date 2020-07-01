module FHIR
  # fhir/invoice_line_item_price_component.rb
  class InvoiceLineItemPriceComponent < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'InvoicePriceComponentType'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :factor, class_name: 'PrimitiveDecimal'
    embeds_one :amount, class_name: 'Money'

    def self.transform_json(json_hash, target = InvoiceLineItemPriceComponent.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = InvoicePriceComponentType.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['factor'] = PrimitiveDecimal.transform_json(json_hash['factor'], json_hash['_factor']) unless json_hash['factor'].nil?      
      result['amount'] = Money.transform_json(json_hash['amount']) unless json_hash['amount'].nil?      

      result
    end
  end
end
