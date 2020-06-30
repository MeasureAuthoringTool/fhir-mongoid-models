module FHIR
  # fhir/invoice_line_item.rb
  class InvoiceLineItem < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'InvoiceLineItem'
    embeds_one :sequence, class_name: 'PrimitivePositiveInt'
    embeds_one :chargeItemReference, class_name: 'Reference'
    embeds_one :chargeItemCodeableConcept, class_name: 'CodeableConcept'
    embeds_many :priceComponent, class_name: 'InvoiceLineItemPriceComponent'

    def self.transform_json(json_hash, target=InvoiceLineItem.new)
      result = self.superclass.transform_json(json_hash, target)
      result['sequence'] = PrimitivePositiveInt.transform_json(json_hash['sequence'], json_hash['_sequence']) unless json_hash['sequence'].nil?      
      result['chargeItemReference'] = Reference.transform_json(json_hash['chargeItemReference']) unless json_hash['chargeItemReference'].nil?      
      result['chargeItemCodeableConcept'] = CodeableConcept.transform_json(json_hash['chargeItemCodeableConcept']) unless json_hash['chargeItemCodeableConcept'].nil?      
      result['priceComponent'] = json_hash['priceComponent'].map { |var| InvoiceLineItemPriceComponent.transform_json(var) } unless json_hash['priceComponent'].nil?

      result
    end
  end
end
