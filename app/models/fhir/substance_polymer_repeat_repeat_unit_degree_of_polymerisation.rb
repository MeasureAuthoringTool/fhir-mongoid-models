module FHIR
  # fhir/substance_polymer_repeat_repeat_unit_degree_of_polymerisation.rb
  class SubstancePolymerRepeatRepeatUnitDegreeOfPolymerisation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstancePolymerRepeatRepeatUnitDegreeOfPolymerisation'
    embeds_one :degree, class_name: 'CodeableConcept'
    embeds_one :amount, class_name: 'SubstanceAmount'

    def self.transform_json(json_hash, target=SubstancePolymerRepeatRepeatUnitDegreeOfPolymerisation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['degree'] = CodeableConcept.transform_json(json_hash['degree']) unless json_hash['degree'].nil?      
      result['amount'] = SubstanceAmount.transform_json(json_hash['amount']) unless json_hash['amount'].nil?      

      result
    end
  end
end
