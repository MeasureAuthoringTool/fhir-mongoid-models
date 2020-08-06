module FHIR
  # fhir/medicinal_product_special_designation.rb
  class MedicinalProductSpecialDesignation < BackboneElement
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :intendedUse, class_name: 'FHIR::CodeableConcept'    
    embeds_one :indicationCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :indicationReference, class_name: 'FHIR::Reference'    
    embeds_one :status, class_name: 'FHIR::CodeableConcept'    
    embeds_one :date, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :species, class_name: 'FHIR::CodeableConcept'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.intendedUse.nil? 
        result['intendedUse'] = self.intendedUse.as_json(*args)
      end
      unless self.indicationCodeableConcept.nil?
        result['indicationCodeableConcept'] = self.indicationCodeableConcept.as_json(*args)                        
      end          
      unless self.indicationReference.nil?
        result['indicationReference'] = self.indicationReference.as_json(*args)                        
      end          
      unless self.status.nil? 
        result['status'] = self.status.as_json(*args)
      end
      unless self.date.nil? 
        result['date'] = self.date.value
        serialized = Extension.serializePrimitiveExtension(self.date)            
        result['_date'] = serialized unless serialized.nil?
      end
      unless self.species.nil? 
        result['species'] = self.species.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicinalProductSpecialDesignation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['intendedUse'] = CodeableConcept.transform_json(json_hash['intendedUse']) unless json_hash['intendedUse'].nil?
      result['indicationCodeableConcept'] = CodeableConcept.transform_json(json_hash['indicationCodeableConcept']) unless json_hash['indicationCodeableConcept'].nil?
      result['indicationReference'] = Reference.transform_json(json_hash['indicationReference']) unless json_hash['indicationReference'].nil?
      result['status'] = CodeableConcept.transform_json(json_hash['status']) unless json_hash['status'].nil?
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?
      result['species'] = CodeableConcept.transform_json(json_hash['species']) unless json_hash['species'].nil?

      result
    end
  end
end
