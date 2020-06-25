module FHIR
  # fhir/substance_specification_property.rb
  class SubstanceSpecificationProperty < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceSpecificationProperty'
    embeds_one :category, class_name: 'CodeableConcept'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :parameters, class_name: 'PrimitiveString'
    embeds_one :definingSubstanceReference, class_name: 'Reference'
    embeds_one :definingSubstanceCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :amountQuantity, class_name: 'Quantity'
    embeds_one :amountstring, class_name: 'PrimitiveString'

    def self.transform_json(json_hash)
      result = SubstanceSpecificationProperty.new
      result['category'] = CodeableConcept.transform_json(json_hash['category']) unless json_hash['category'].nil?      
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['parameters'] = PrimitiveString.transform_json(json_hash['parameters'], json_hash['_parameters']) unless json_hash['parameters'].nil?      
      result['definingSubstanceReference'] = Reference.transform_json(json_hash['definingSubstanceReference']) unless json_hash['definingSubstanceReference'].nil?      
      result['definingSubstanceCodeableConcept'] = CodeableConcept.transform_json(json_hash['definingSubstanceCodeableConcept']) unless json_hash['definingSubstanceCodeableConcept'].nil?      
      result['amountQuantity'] = Quantity.transform_json(json_hash['amountQuantity']) unless json_hash['amountQuantity'].nil?      
      result['amountstring'] = PrimitiveString.transform_json(json_hash['amountstring'], json_hash['_amountstring']) unless json_hash['amountstring'].nil?      

      result
    end
  end
end
