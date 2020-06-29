module FHIR
  # fhir/substance_polymer_repeat_repeat_unit_structural_representation.rb
  class SubstancePolymerRepeatRepeatUnitStructuralRepresentation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstancePolymerRepeatRepeatUnitStructuralRepresentation'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :representation, class_name: 'PrimitiveString'
    embeds_one :attachment, class_name: 'Attachment'

    def self.transform_json(json_hash, target=SubstancePolymerRepeatRepeatUnitStructuralRepresentation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['representation'] = PrimitiveString.transform_json(json_hash['representation'], json_hash['_representation']) unless json_hash['representation'].nil?      
      result['attachment'] = Attachment.transform_json(json_hash['attachment']) unless json_hash['attachment'].nil?      

      result
    end
  end
end
