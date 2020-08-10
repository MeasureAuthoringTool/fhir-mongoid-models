module FHIR
  # fhir/vision_prescription_lens_specification_prism.rb
  class VisionPrescriptionLensSpecificationPrism < BackboneElement
    include Mongoid::Document
    embeds_one :amount, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :base, class_name: 'FHIR::VisionBase'    
    
    def as_json(*args)
      result = super      
      unless self.amount.nil? 
        result['amount'] = self.amount.value
        serialized = Extension.serializePrimitiveExtension(self.amount)            
        result['_amount'] = serialized unless serialized.nil?
      end
      unless self.base.nil? 
        result['base'] = self.base.value
        serialized = Extension.serializePrimitiveExtension(self.base)            
        result['_base'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = VisionPrescriptionLensSpecificationPrism.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['amount'] = PrimitiveDecimal.transform_json(json_hash['amount'], json_hash['_amount']) unless json_hash['amount'].nil?
      result['base'] = VisionBase.transform_json(json_hash['base'], json_hash['_base']) unless json_hash['base'].nil?

      result
    end
  end
end
