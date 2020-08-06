module FHIR
  # fhir/family_member_history.rb
  class FamilyMemberHistory < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_many :instantiatesCanonical, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_many :instantiatesUri, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :status, class_name: 'FHIR::FamilyHistoryStatus'    
    embeds_one :dataAbsentReason, class_name: 'FHIR::CodeableConcept'    
    embeds_one :patient, class_name: 'FHIR::Reference'    
    embeds_one :date, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :relationship, class_name: 'FHIR::CodeableConcept'    
    embeds_one :sex, class_name: 'FHIR::CodeableConcept'    
    embeds_one :bornPeriod, class_name: 'FHIR::Period'    
    embeds_one :bornDate, class_name: 'FHIR::PrimitiveDate'    
    embeds_one :bornString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :ageAge, class_name: 'FHIR::Age'    
    embeds_one :ageRange, class_name: 'FHIR::Range'    
    embeds_one :ageString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :estimatedAge, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :deceasedBoolean, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :deceasedAge, class_name: 'FHIR::Age'    
    embeds_one :deceasedRange, class_name: 'FHIR::Range'    
    embeds_one :deceasedDate, class_name: 'FHIR::PrimitiveDate'    
    embeds_one :deceasedString, class_name: 'FHIR::PrimitiveString'    
    embeds_many :reasonCode, class_name: 'FHIR::CodeableConcept'    
    embeds_many :reasonReference, class_name: 'FHIR::Reference'    
    embeds_many :note, class_name: 'FHIR::Annotation'    
    embeds_many :condition, class_name: 'FHIR::FamilyMemberHistoryCondition'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.instantiatesCanonical.nil?  || !self.instantiatesCanonical.any? 
        result['instantiatesCanonical'] = self.instantiatesCanonical.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.instantiatesCanonical)                              
        result['_instantiatesCanonical'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.instantiatesUri.nil?  || !self.instantiatesUri.any? 
        result['instantiatesUri'] = self.instantiatesUri.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.instantiatesUri)                              
        result['_instantiatesUri'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.dataAbsentReason.nil? 
        result['dataAbsentReason'] = self.dataAbsentReason.as_json(*args)
      end
      unless self.patient.nil? 
        result['patient'] = self.patient.as_json(*args)
      end
      unless self.date.nil? 
        result['date'] = self.date.value
        serialized = Extension.serializePrimitiveExtension(self.date)            
        result['_date'] = serialized unless serialized.nil?
      end
      unless self.name.nil? 
        result['name'] = self.name.value
        serialized = Extension.serializePrimitiveExtension(self.name)            
        result['_name'] = serialized unless serialized.nil?
      end
      unless self.relationship.nil? 
        result['relationship'] = self.relationship.as_json(*args)
      end
      unless self.sex.nil? 
        result['sex'] = self.sex.as_json(*args)
      end
      unless self.bornPeriod.nil?
        result['bornPeriod'] = self.bornPeriod.as_json(*args)                        
      end          
      unless self.bornDate.nil?
        result['bornDate'] = self.bornDate.value                        
        serialized = Extension.serializePrimitiveExtension(self.bornDate) 
        result['_bornDate'] = serialized unless serialized.nil?
      end          
      unless self.bornString.nil?
        result['bornString'] = self.bornString.value                        
        serialized = Extension.serializePrimitiveExtension(self.bornString) 
        result['_bornString'] = serialized unless serialized.nil?
      end          
      unless self.ageAge.nil?
        result['ageAge'] = self.ageAge.as_json(*args)                        
      end          
      unless self.ageRange.nil?
        result['ageRange'] = self.ageRange.as_json(*args)                        
      end          
      unless self.ageString.nil?
        result['ageString'] = self.ageString.value                        
        serialized = Extension.serializePrimitiveExtension(self.ageString) 
        result['_ageString'] = serialized unless serialized.nil?
      end          
      unless self.estimatedAge.nil? 
        result['estimatedAge'] = self.estimatedAge.value
        serialized = Extension.serializePrimitiveExtension(self.estimatedAge)            
        result['_estimatedAge'] = serialized unless serialized.nil?
      end
      unless self.deceasedBoolean.nil?
        result['deceasedBoolean'] = self.deceasedBoolean.value                        
        serialized = Extension.serializePrimitiveExtension(self.deceasedBoolean) 
        result['_deceasedBoolean'] = serialized unless serialized.nil?
      end          
      unless self.deceasedAge.nil?
        result['deceasedAge'] = self.deceasedAge.as_json(*args)                        
      end          
      unless self.deceasedRange.nil?
        result['deceasedRange'] = self.deceasedRange.as_json(*args)                        
      end          
      unless self.deceasedDate.nil?
        result['deceasedDate'] = self.deceasedDate.value                        
        serialized = Extension.serializePrimitiveExtension(self.deceasedDate) 
        result['_deceasedDate'] = serialized unless serialized.nil?
      end          
      unless self.deceasedString.nil?
        result['deceasedString'] = self.deceasedString.value                        
        serialized = Extension.serializePrimitiveExtension(self.deceasedString) 
        result['_deceasedString'] = serialized unless serialized.nil?
      end          
      unless self.reasonCode.nil?  || !self.reasonCode.any? 
        result['reasonCode'] = self.reasonCode.map{ |x| x.as_json(*args) }
      end
      unless self.reasonReference.nil?  || !self.reasonReference.any? 
        result['reasonReference'] = self.reasonReference.map{ |x| x.as_json(*args) }
      end
      unless self.note.nil?  || !self.note.any? 
        result['note'] = self.note.map{ |x| x.as_json(*args) }
      end
      unless self.condition.nil?  || !self.condition.any? 
        result['condition'] = self.condition.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = FamilyMemberHistory.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['instantiatesCanonical'] = json_hash['instantiatesCanonical'].each_with_index.map do |var, i|
        extension_hash = json_hash['_instantiatesCanonical'] && json_hash['_instantiatesCanonical'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['instantiatesCanonical'].nil?
      result['instantiatesUri'] = json_hash['instantiatesUri'].each_with_index.map do |var, i|
        extension_hash = json_hash['_instantiatesUri'] && json_hash['_instantiatesUri'][i]
        PrimitiveUri.transform_json(var, extension_hash)
      end unless json_hash['instantiatesUri'].nil?
      result['status'] = FamilyHistoryStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['dataAbsentReason'] = CodeableConcept.transform_json(json_hash['dataAbsentReason']) unless json_hash['dataAbsentReason'].nil?
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['relationship'] = CodeableConcept.transform_json(json_hash['relationship']) unless json_hash['relationship'].nil?
      result['sex'] = CodeableConcept.transform_json(json_hash['sex']) unless json_hash['sex'].nil?
      result['bornPeriod'] = Period.transform_json(json_hash['bornPeriod']) unless json_hash['bornPeriod'].nil?
      result['bornDate'] = PrimitiveDate.transform_json(json_hash['bornDate'], json_hash['_bornDate']) unless json_hash['bornDate'].nil?
      result['bornString'] = PrimitiveString.transform_json(json_hash['bornString'], json_hash['_bornString']) unless json_hash['bornString'].nil?
      result['ageAge'] = Age.transform_json(json_hash['ageAge']) unless json_hash['ageAge'].nil?
      result['ageRange'] = Range.transform_json(json_hash['ageRange']) unless json_hash['ageRange'].nil?
      result['ageString'] = PrimitiveString.transform_json(json_hash['ageString'], json_hash['_ageString']) unless json_hash['ageString'].nil?
      result['estimatedAge'] = PrimitiveBoolean.transform_json(json_hash['estimatedAge'], json_hash['_estimatedAge']) unless json_hash['estimatedAge'].nil?
      result['deceasedBoolean'] = PrimitiveBoolean.transform_json(json_hash['deceasedBoolean'], json_hash['_deceasedBoolean']) unless json_hash['deceasedBoolean'].nil?
      result['deceasedAge'] = Age.transform_json(json_hash['deceasedAge']) unless json_hash['deceasedAge'].nil?
      result['deceasedRange'] = Range.transform_json(json_hash['deceasedRange']) unless json_hash['deceasedRange'].nil?
      result['deceasedDate'] = PrimitiveDate.transform_json(json_hash['deceasedDate'], json_hash['_deceasedDate']) unless json_hash['deceasedDate'].nil?
      result['deceasedString'] = PrimitiveString.transform_json(json_hash['deceasedString'], json_hash['_deceasedString']) unless json_hash['deceasedString'].nil?
      result['reasonCode'] = json_hash['reasonCode'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['reasonCode'].nil?
      result['reasonReference'] = json_hash['reasonReference'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['reasonReference'].nil?
      result['note'] = json_hash['note'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Annotation.transform_json(var) 
        end
      } unless json_hash['note'].nil?
      result['condition'] = json_hash['condition'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          FamilyMemberHistoryCondition.transform_json(var) 
        end
      } unless json_hash['condition'].nil?

      result
    end
  end
end
