module FHIR
  # fhir/substance_specification_name_official.rb
  class SubstanceSpecificationNameOfficial < BackboneElement
    include Mongoid::Document
    embeds_one :authority, class_name: 'FHIR::CodeableConcept'    
    embeds_one :status, class_name: 'FHIR::CodeableConcept'    
    embeds_one :date, class_name: 'FHIR::PrimitiveDateTime'    
    
    def as_json(*args)
      result = super      
      unless self.authority.nil? 
        result['authority'] = self.authority.as_json(*args)
      end
      unless self.status.nil? 
        result['status'] = self.status.as_json(*args)
      end
      unless self.date.nil? 
        result['date'] = self.date.value
        serialized = Extension.serializePrimitiveExtension(self.date)            
        result['_date'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SubstanceSpecificationNameOfficial.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['authority'] = CodeableConcept.transform_json(json_hash['authority']) unless json_hash['authority'].nil?
      result['status'] = CodeableConcept.transform_json(json_hash['status']) unless json_hash['status'].nil?
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?

      result
    end
  end
end
