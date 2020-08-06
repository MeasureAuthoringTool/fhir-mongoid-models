module FHIR
  # fhir/immunization_evaluation.rb
  class ImmunizationEvaluation < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::ImmunizationEvaluationStatus'    
    embeds_one :patient, class_name: 'FHIR::Reference'    
    embeds_one :date, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :authority, class_name: 'FHIR::Reference'    
    embeds_one :targetDisease, class_name: 'FHIR::CodeableConcept'    
    embeds_one :immunizationEvent, class_name: 'FHIR::Reference'    
    embeds_one :doseStatus, class_name: 'FHIR::CodeableConcept'    
    embeds_many :doseStatusReason, class_name: 'FHIR::CodeableConcept'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :series, class_name: 'FHIR::PrimitiveString'    
    embeds_one :doseNumberPositiveInt, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_one :doseNumberString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :seriesDosesPositiveInt, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_one :seriesDosesString, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.patient.nil? 
        result['patient'] = self.patient.as_json(*args)
      end
      unless self.date.nil? 
        result['date'] = self.date.value
        serialized = Extension.serializePrimitiveExtension(self.date)            
        result['_date'] = serialized unless serialized.nil?
      end
      unless self.authority.nil? 
        result['authority'] = self.authority.as_json(*args)
      end
      unless self.targetDisease.nil? 
        result['targetDisease'] = self.targetDisease.as_json(*args)
      end
      unless self.immunizationEvent.nil? 
        result['immunizationEvent'] = self.immunizationEvent.as_json(*args)
      end
      unless self.doseStatus.nil? 
        result['doseStatus'] = self.doseStatus.as_json(*args)
      end
      unless self.doseStatusReason.nil?  || !self.doseStatusReason.any? 
        result['doseStatusReason'] = self.doseStatusReason.map{ |x| x.as_json(*args) }
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.series.nil? 
        result['series'] = self.series.value
        serialized = Extension.serializePrimitiveExtension(self.series)            
        result['_series'] = serialized unless serialized.nil?
      end
      unless self.doseNumberPositiveInt.nil?
        result['doseNumberPositiveInt'] = self.doseNumberPositiveInt.value                        
        serialized = Extension.serializePrimitiveExtension(self.doseNumberPositiveInt) 
        result['_doseNumberPositiveInt'] = serialized unless serialized.nil?
      end          
      unless self.doseNumberString.nil?
        result['doseNumberString'] = self.doseNumberString.value                        
        serialized = Extension.serializePrimitiveExtension(self.doseNumberString) 
        result['_doseNumberString'] = serialized unless serialized.nil?
      end          
      unless self.seriesDosesPositiveInt.nil?
        result['seriesDosesPositiveInt'] = self.seriesDosesPositiveInt.value                        
        serialized = Extension.serializePrimitiveExtension(self.seriesDosesPositiveInt) 
        result['_seriesDosesPositiveInt'] = serialized unless serialized.nil?
      end          
      unless self.seriesDosesString.nil?
        result['seriesDosesString'] = self.seriesDosesString.value                        
        serialized = Extension.serializePrimitiveExtension(self.seriesDosesString) 
        result['_seriesDosesString'] = serialized unless serialized.nil?
      end          
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ImmunizationEvaluation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['status'] = ImmunizationEvaluationStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?
      result['authority'] = Reference.transform_json(json_hash['authority']) unless json_hash['authority'].nil?
      result['targetDisease'] = CodeableConcept.transform_json(json_hash['targetDisease']) unless json_hash['targetDisease'].nil?
      result['immunizationEvent'] = Reference.transform_json(json_hash['immunizationEvent']) unless json_hash['immunizationEvent'].nil?
      result['doseStatus'] = CodeableConcept.transform_json(json_hash['doseStatus']) unless json_hash['doseStatus'].nil?
      result['doseStatusReason'] = json_hash['doseStatusReason'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['doseStatusReason'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['series'] = PrimitiveString.transform_json(json_hash['series'], json_hash['_series']) unless json_hash['series'].nil?
      result['doseNumberPositiveInt'] = PrimitivePositiveInt.transform_json(json_hash['doseNumberPositiveInt'], json_hash['_doseNumberPositiveInt']) unless json_hash['doseNumberPositiveInt'].nil?
      result['doseNumberString'] = PrimitiveString.transform_json(json_hash['doseNumberString'], json_hash['_doseNumberString']) unless json_hash['doseNumberString'].nil?
      result['seriesDosesPositiveInt'] = PrimitivePositiveInt.transform_json(json_hash['seriesDosesPositiveInt'], json_hash['_seriesDosesPositiveInt']) unless json_hash['seriesDosesPositiveInt'].nil?
      result['seriesDosesString'] = PrimitiveString.transform_json(json_hash['seriesDosesString'], json_hash['_seriesDosesString']) unless json_hash['seriesDosesString'].nil?

      result
    end
  end
end
