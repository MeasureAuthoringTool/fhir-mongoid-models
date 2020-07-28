module FHIR
  # fhir/substance_specification_property.rb
  class SubstanceSpecificationProperty < BackboneElement
    include Mongoid::Document
    embeds_one :category, class_name: 'FHIR::CodeableConcept'    
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :parameters, class_name: 'FHIR::PrimitiveString'    
    embeds_one :definingSubstanceReference, class_name: 'FHIR::Reference'    
    embeds_one :definingSubstanceCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :amountQuantity, class_name: 'FHIR::Quantity'    
    embeds_one :amountString, class_name: 'FHIR::PrimitiveString'    

    def self.transform_json(json_hash, target = SubstanceSpecificationProperty.new)
      result = self.superclass.transform_json(json_hash, target)
      result['category'] = CodeableConcept.transform_json(json_hash['category']) unless json_hash['category'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['parameters'] = PrimitiveString.transform_json(json_hash['parameters'], json_hash['_parameters']) unless json_hash['parameters'].nil?
      result['definingSubstanceReference'] = Reference.transform_json(json_hash['definingSubstanceReference']) unless json_hash['definingSubstanceReference'].nil?
      result['definingSubstanceCodeableConcept'] = CodeableConcept.transform_json(json_hash['definingSubstanceCodeableConcept']) unless json_hash['definingSubstanceCodeableConcept'].nil?
      result['amountQuantity'] = Quantity.transform_json(json_hash['amountQuantity']) unless json_hash['amountQuantity'].nil?
      result['amountString'] = PrimitiveString.transform_json(json_hash['amountString'], json_hash['_amountString']) unless json_hash['amountString'].nil?

      result
    end
  end
end
