module FHIR
  # fhir/substance_amount.rb
  class SubstanceAmount < BackboneElement
    include Mongoid::Document
    embeds_one :amountQuantity, class_name: 'FHIR::Quantity'    
    embeds_one :amountRange, class_name: 'FHIR::Range'    
    embeds_one :amountString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :amountType, class_name: 'FHIR::CodeableConcept'    
    embeds_one :amountText, class_name: 'FHIR::PrimitiveString'    
    embeds_one :referenceRange, class_name: 'FHIR::SubstanceAmountReferenceRange'    

    def self.transform_json(json_hash, target = SubstanceAmount.new)
      result = self.superclass.transform_json(json_hash, target)
      result['amountQuantity'] = Quantity.transform_json(json_hash['amountQuantity']) unless json_hash['amountQuantity'].nil?
      result['amountRange'] = Range.transform_json(json_hash['amountRange']) unless json_hash['amountRange'].nil?
      result['amountString'] = PrimitiveString.transform_json(json_hash['amountString'], json_hash['_amountString']) unless json_hash['amountString'].nil?
      result['amountType'] = CodeableConcept.transform_json(json_hash['amountType']) unless json_hash['amountType'].nil?
      result['amountText'] = PrimitiveString.transform_json(json_hash['amountText'], json_hash['_amountText']) unless json_hash['amountText'].nil?
      result['referenceRange'] = SubstanceAmountReferenceRange.transform_json(json_hash['referenceRange']) unless json_hash['referenceRange'].nil?

      result
    end
  end
end
