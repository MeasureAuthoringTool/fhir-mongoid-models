module FHIR
  # fhir/substance_polymer_repeat.rb
  class SubstancePolymerRepeat < BackboneElement
    include Mongoid::Document
    embeds_one :numberOfUnits, class_name: 'PrimitiveInteger'
    embeds_one :averageMolecularFormula, class_name: 'PrimitiveString'
    embeds_one :repeatUnitAmountType, class_name: 'CodeableConcept'
    embeds_many :repeatUnit, class_name: 'SubstancePolymerRepeatRepeatUnit'

    def self.transform_json(json_hash, target = SubstancePolymerRepeat.new)
      result = self.superclass.transform_json(json_hash, target)
      result['numberOfUnits'] = PrimitiveInteger.transform_json(json_hash['numberOfUnits'], json_hash['_numberOfUnits']) unless json_hash['numberOfUnits'].nil?      
      result['averageMolecularFormula'] = PrimitiveString.transform_json(json_hash['averageMolecularFormula'], json_hash['_averageMolecularFormula']) unless json_hash['averageMolecularFormula'].nil?      
      result['repeatUnitAmountType'] = CodeableConcept.transform_json(json_hash['repeatUnitAmountType']) unless json_hash['repeatUnitAmountType'].nil?      
      result['repeatUnit'] = json_hash['repeatUnit'].map { |var| SubstancePolymerRepeatRepeatUnit.transform_json(var) } unless json_hash['repeatUnit'].nil?

      result
    end
  end
end
