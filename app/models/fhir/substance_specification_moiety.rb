module FHIR
  # fhir/substance_specification_moiety.rb
  class SubstanceSpecificationMoiety < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceSpecificationMoiety'
    embeds_one :role, class_name: 'CodeableConcept'
    embeds_one :identifier, class_name: 'Identifier'
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_one :stereochemistry, class_name: 'CodeableConcept'
    embeds_one :opticalActivity, class_name: 'CodeableConcept'
    embeds_one :molecularFormula, class_name: 'PrimitiveString'
    embeds_one :amountQuantity, class_name: 'Quantity'
    embeds_one :amountstring, class_name: 'PrimitiveString'

    def self.transform_json(json_hash)
      result = SubstanceSpecificationMoiety.new
      result['role'] = CodeableConcept.transform_json(json_hash['role']) unless json_hash['role'].nil?      
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?      
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['stereochemistry'] = CodeableConcept.transform_json(json_hash['stereochemistry']) unless json_hash['stereochemistry'].nil?      
      result['opticalActivity'] = CodeableConcept.transform_json(json_hash['opticalActivity']) unless json_hash['opticalActivity'].nil?      
      result['molecularFormula'] = PrimitiveString.transform_json(json_hash['molecularFormula'], json_hash['_molecularFormula']) unless json_hash['molecularFormula'].nil?      
      result['amountQuantity'] = Quantity.transform_json(json_hash['amountQuantity']) unless json_hash['amountQuantity'].nil?      
      result['amountstring'] = PrimitiveString.transform_json(json_hash['amountstring'], json_hash['_amountstring']) unless json_hash['amountstring'].nil?      

      result
    end
  end
end
