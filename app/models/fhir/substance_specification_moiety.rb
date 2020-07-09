module FHIR
  # fhir/substance_specification_moiety.rb
  class SubstanceSpecificationMoiety < BackboneElement
    include Mongoid::Document
    embeds_one :role, class_name: 'FHIR::CodeableConcept'
    embeds_one :identifier, class_name: 'FHIR::Identifier'
    embeds_one :name, class_name: 'FHIR::PrimitiveString'
    embeds_one :stereochemistry, class_name: 'FHIR::CodeableConcept'
    embeds_one :opticalActivity, class_name: 'FHIR::CodeableConcept'
    embeds_one :molecularFormula, class_name: 'FHIR::PrimitiveString'
    embeds_one :amountQuantity, class_name: 'FHIR::Quantity'
    embeds_one :amountString, class_name: 'FHIR::PrimitiveString'

    def self.transform_json(json_hash, target = SubstanceSpecificationMoiety.new)
      result = self.superclass.transform_json(json_hash, target)
      result['role'] = CodeableConcept.transform_json(json_hash['role']) unless json_hash['role'].nil?      
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?      
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['stereochemistry'] = CodeableConcept.transform_json(json_hash['stereochemistry']) unless json_hash['stereochemistry'].nil?      
      result['opticalActivity'] = CodeableConcept.transform_json(json_hash['opticalActivity']) unless json_hash['opticalActivity'].nil?      
      result['molecularFormula'] = PrimitiveString.transform_json(json_hash['molecularFormula'], json_hash['_molecularFormula']) unless json_hash['molecularFormula'].nil?      
      result['amountQuantity'] = Quantity.transform_json(json_hash['amountQuantity']) unless json_hash['amountQuantity'].nil?      
      result['amountString'] = PrimitiveString.transform_json(json_hash['amountString'], json_hash['_amountString']) unless json_hash['amountString'].nil?      

      result
    end
  end
end
