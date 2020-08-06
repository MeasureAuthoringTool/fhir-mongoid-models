module FHIR
  # fhir/allergy_intolerance_reaction.rb
  class AllergyIntoleranceReaction < BackboneElement
    include Mongoid::Document
    embeds_one :substance, class_name: 'FHIR::CodeableConcept'    
    embeds_many :manifestation, class_name: 'FHIR::CodeableConcept'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :onset, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :severity, class_name: 'FHIR::AllergyIntoleranceSeverity'    
    embeds_one :exposureRoute, class_name: 'FHIR::CodeableConcept'    
    embeds_many :note, class_name: 'FHIR::Annotation'    
    
    def as_json(*args)
      result = super      
      unless self.substance.nil? 
        result['substance'] = self.substance.as_json(*args)
      end
      unless self.manifestation.nil?  || !self.manifestation.any? 
        result['manifestation'] = self.manifestation.map{ |x| x.as_json(*args) }
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.onset.nil? 
        result['onset'] = self.onset.value
        serialized = Extension.serializePrimitiveExtension(self.onset)            
        result['_onset'] = serialized unless serialized.nil?
      end
      unless self.severity.nil? 
        result['severity'] = self.severity.value
        serialized = Extension.serializePrimitiveExtension(self.severity)            
        result['_severity'] = serialized unless serialized.nil?
      end
      unless self.exposureRoute.nil? 
        result['exposureRoute'] = self.exposureRoute.as_json(*args)
      end
      unless self.note.nil?  || !self.note.any? 
        result['note'] = self.note.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = AllergyIntoleranceReaction.new)
      result = self.superclass.transform_json(json_hash, target)
      result['substance'] = CodeableConcept.transform_json(json_hash['substance']) unless json_hash['substance'].nil?
      result['manifestation'] = json_hash['manifestation'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['manifestation'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['onset'] = PrimitiveDateTime.transform_json(json_hash['onset'], json_hash['_onset']) unless json_hash['onset'].nil?
      result['severity'] = AllergyIntoleranceSeverity.transform_json(json_hash['severity'], json_hash['_severity']) unless json_hash['severity'].nil?
      result['exposureRoute'] = CodeableConcept.transform_json(json_hash['exposureRoute']) unless json_hash['exposureRoute'].nil?
      result['note'] = json_hash['note'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Annotation.transform_json(var) 
        end
      } unless json_hash['note'].nil?

      result
    end
  end
end
