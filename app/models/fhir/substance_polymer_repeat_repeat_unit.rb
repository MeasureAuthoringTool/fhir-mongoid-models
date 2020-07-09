module FHIR
  # fhir/substance_polymer_repeat_repeat_unit.rb
  class SubstancePolymerRepeatRepeatUnit < BackboneElement
    include Mongoid::Document
    embeds_one :orientationOfPolymerisation, class_name: 'FHIR::CodeableConcept'
    embeds_one :repeatUnit, class_name: 'FHIR::PrimitiveString'
    embeds_one :amount, class_name: 'FHIR::SubstanceAmount'
    embeds_many :degreeOfPolymerisation, class_name: 'FHIR::SubstancePolymerRepeatRepeatUnitDegreeOfPolymerisation'
    embeds_many :structuralRepresentation, class_name: 'FHIR::SubstancePolymerRepeatRepeatUnitStructuralRepresentation'

    def self.transform_json(json_hash, target = SubstancePolymerRepeatRepeatUnit.new)
      result = self.superclass.transform_json(json_hash, target)
      result['orientationOfPolymerisation'] = CodeableConcept.transform_json(json_hash['orientationOfPolymerisation']) unless json_hash['orientationOfPolymerisation'].nil?      
      result['repeatUnit'] = PrimitiveString.transform_json(json_hash['repeatUnit'], json_hash['_repeatUnit']) unless json_hash['repeatUnit'].nil?      
      result['amount'] = SubstanceAmount.transform_json(json_hash['amount']) unless json_hash['amount'].nil?      
      result['degreeOfPolymerisation'] = json_hash['degreeOfPolymerisation'].map { |var| SubstancePolymerRepeatRepeatUnitDegreeOfPolymerisation.transform_json(var) } unless json_hash['degreeOfPolymerisation'].nil?
      result['structuralRepresentation'] = json_hash['structuralRepresentation'].map { |var| SubstancePolymerRepeatRepeatUnitStructuralRepresentation.transform_json(var) } unless json_hash['structuralRepresentation'].nil?

      result
    end
  end
end
