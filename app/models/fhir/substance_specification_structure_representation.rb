module FHIR
  # fhir/substance_specification_structure_representation.rb
  class SubstanceSpecificationStructureRepresentation < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :representation, class_name: 'FHIR::PrimitiveString'    
    embeds_one :attachment, class_name: 'FHIR::Attachment'    

    def self.transform_json(json_hash, target = SubstanceSpecificationStructureRepresentation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['representation'] = PrimitiveString.transform_json(json_hash['representation'], json_hash['_representation']) unless json_hash['representation'].nil?
      result['attachment'] = Attachment.transform_json(json_hash['attachment']) unless json_hash['attachment'].nil?

      result
    end
  end
end
