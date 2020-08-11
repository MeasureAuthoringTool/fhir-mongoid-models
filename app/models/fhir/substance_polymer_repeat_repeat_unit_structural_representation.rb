module FHIR
  # fhir/substance_polymer_repeat_repeat_unit_structural_representation.rb
  class SubstancePolymerRepeatRepeatUnitStructuralRepresentation < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :representation, class_name: 'FHIR::PrimitiveString'    
    embeds_one :attachment, class_name: 'FHIR::Attachment'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.representation.nil? 
        result['representation'] = self.representation.value
        serialized = Extension.serializePrimitiveExtension(self.representation)            
        result['_representation'] = serialized unless serialized.nil?
      end
      unless self.attachment.nil? 
        result['attachment'] = self.attachment.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SubstancePolymerRepeatRepeatUnitStructuralRepresentation.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['representation'] = PrimitiveString.transform_json(json_hash['representation'], json_hash['_representation']) unless json_hash['representation'].nil?
      result['attachment'] = Attachment.transform_json(json_hash['attachment']) unless json_hash['attachment'].nil?

      result
    end
  end
end
