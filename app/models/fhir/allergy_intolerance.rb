module FHIR
  # fhir/allergy_intolerance.rb
  class AllergyIntolerance < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :clinicalStatus, class_name: 'FHIR::CodeableConcept'    
    embeds_one :verificationStatus, class_name: 'FHIR::CodeableConcept'    
    embeds_one :type, class_name: 'FHIR::AllergyIntoleranceType'    
    embeds_many :category, class_name: 'FHIR::AllergyIntoleranceCategory'    
    embeds_one :criticality, class_name: 'FHIR::AllergyIntoleranceCriticality'    
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :patient, class_name: 'FHIR::Reference'    
    embeds_one :encounter, class_name: 'FHIR::Reference'    
    embeds_one :onsetDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :onsetAge, class_name: 'FHIR::Age'    
    embeds_one :onsetPeriod, class_name: 'FHIR::Period'    
    embeds_one :onsetRange, class_name: 'FHIR::Range'    
    embeds_one :onsetString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :recordedDate, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :recorder, class_name: 'FHIR::Reference'    
    embeds_one :asserter, class_name: 'FHIR::Reference'    
    embeds_one :lastOccurrence, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_many :note, class_name: 'FHIR::Annotation'    
    embeds_many :reaction, class_name: 'FHIR::AllergyIntoleranceReaction'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.clinicalStatus.nil? 
        result['clinicalStatus'] = self.clinicalStatus.as_json(*args)
      end
      unless self.verificationStatus.nil? 
        result['verificationStatus'] = self.verificationStatus.as_json(*args)
      end
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
      end
      unless self.category.nil?  || !self.category.any? 
        result['category'] = self.category.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.category)                              
        result['_category'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.criticality.nil? 
        result['criticality'] = self.criticality.value
        serialized = Extension.serializePrimitiveExtension(self.criticality)            
        result['_criticality'] = serialized unless serialized.nil?
      end
      unless self.code.nil? 
        result['code'] = self.code.as_json(*args)
      end
      unless self.patient.nil? 
        result['patient'] = self.patient.as_json(*args)
      end
      unless self.encounter.nil? 
        result['encounter'] = self.encounter.as_json(*args)
      end
      unless self.onsetDateTime.nil?
        result['onsetDateTime'] = self.onsetDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.onsetDateTime) 
        result['_onsetDateTime'] = serialized unless serialized.nil?
      end          
      unless self.onsetAge.nil?
        result['onsetAge'] = self.onsetAge.as_json(*args)                        
      end          
      unless self.onsetPeriod.nil?
        result['onsetPeriod'] = self.onsetPeriod.as_json(*args)                        
      end          
      unless self.onsetRange.nil?
        result['onsetRange'] = self.onsetRange.as_json(*args)                        
      end          
      unless self.onsetString.nil?
        result['onsetString'] = self.onsetString.value                        
        serialized = Extension.serializePrimitiveExtension(self.onsetString) 
        result['_onsetString'] = serialized unless serialized.nil?
      end          
      unless self.recordedDate.nil? 
        result['recordedDate'] = self.recordedDate.value
        serialized = Extension.serializePrimitiveExtension(self.recordedDate)            
        result['_recordedDate'] = serialized unless serialized.nil?
      end
      unless self.recorder.nil? 
        result['recorder'] = self.recorder.as_json(*args)
      end
      unless self.asserter.nil? 
        result['asserter'] = self.asserter.as_json(*args)
      end
      unless self.lastOccurrence.nil? 
        result['lastOccurrence'] = self.lastOccurrence.value
        serialized = Extension.serializePrimitiveExtension(self.lastOccurrence)            
        result['_lastOccurrence'] = serialized unless serialized.nil?
      end
      unless self.note.nil?  || !self.note.any? 
        result['note'] = self.note.map{ |x| x.as_json(*args) }
      end
      unless self.reaction.nil?  || !self.reaction.any? 
        result['reaction'] = self.reaction.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = AllergyIntolerance.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['clinicalStatus'] = CodeableConcept.transform_json(json_hash['clinicalStatus']) unless json_hash['clinicalStatus'].nil?
      result['verificationStatus'] = CodeableConcept.transform_json(json_hash['verificationStatus']) unless json_hash['verificationStatus'].nil?
      result['type'] = AllergyIntoleranceType.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['category'] = json_hash['category'].each_with_index.map do |var, i|
        extension_hash = json_hash['_category'] && json_hash['_category'][i]
        AllergyIntoleranceCategory.transform_json(var, extension_hash)
      end unless json_hash['category'].nil?
      result['criticality'] = AllergyIntoleranceCriticality.transform_json(json_hash['criticality'], json_hash['_criticality']) unless json_hash['criticality'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?
      result['onsetDateTime'] = PrimitiveDateTime.transform_json(json_hash['onsetDateTime'], json_hash['_onsetDateTime']) unless json_hash['onsetDateTime'].nil?
      result['onsetAge'] = Age.transform_json(json_hash['onsetAge']) unless json_hash['onsetAge'].nil?
      result['onsetPeriod'] = Period.transform_json(json_hash['onsetPeriod']) unless json_hash['onsetPeriod'].nil?
      result['onsetRange'] = Range.transform_json(json_hash['onsetRange']) unless json_hash['onsetRange'].nil?
      result['onsetString'] = PrimitiveString.transform_json(json_hash['onsetString'], json_hash['_onsetString']) unless json_hash['onsetString'].nil?
      result['recordedDate'] = PrimitiveDateTime.transform_json(json_hash['recordedDate'], json_hash['_recordedDate']) unless json_hash['recordedDate'].nil?
      result['recorder'] = Reference.transform_json(json_hash['recorder']) unless json_hash['recorder'].nil?
      result['asserter'] = Reference.transform_json(json_hash['asserter']) unless json_hash['asserter'].nil?
      result['lastOccurrence'] = PrimitiveDateTime.transform_json(json_hash['lastOccurrence'], json_hash['_lastOccurrence']) unless json_hash['lastOccurrence'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['reaction'] = json_hash['reaction'].map { |var| AllergyIntoleranceReaction.transform_json(var) } unless json_hash['reaction'].nil?

      result
    end
  end
end
