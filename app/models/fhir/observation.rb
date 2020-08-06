module FHIR
  # fhir/observation.rb
  class Observation < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_many :basedOn, class_name: 'FHIR::Reference'    
    embeds_many :partOf, class_name: 'FHIR::Reference'    
    embeds_one :status, class_name: 'FHIR::ObservationStatus'    
    embeds_many :category, class_name: 'FHIR::CodeableConcept'    
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :subject, class_name: 'FHIR::Reference'    
    embeds_many :focus, class_name: 'FHIR::Reference'    
    embeds_one :encounter, class_name: 'FHIR::Reference'    
    embeds_one :effectiveDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :effectivePeriod, class_name: 'FHIR::Period'    
    embeds_one :effectiveTiming, class_name: 'FHIR::Timing'    
    embeds_one :effectiveInstant, class_name: 'FHIR::PrimitiveInstant'    
    embeds_one :issued, class_name: 'FHIR::PrimitiveInstant'    
    embeds_many :performer, class_name: 'FHIR::Reference'    
    embeds_one :valueQuantity, class_name: 'FHIR::Quantity'    
    embeds_one :valueCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :valueString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :valueBoolean, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :valueInteger, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :valueRange, class_name: 'FHIR::Range'    
    embeds_one :valueRatio, class_name: 'FHIR::Ratio'    
    embeds_one :valueSampledData, class_name: 'FHIR::SampledData'    
    embeds_one :valueTime, class_name: 'FHIR::PrimitiveTime'    
    embeds_one :valueDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :valuePeriod, class_name: 'FHIR::Period'    
    embeds_one :dataAbsentReason, class_name: 'FHIR::CodeableConcept'    
    embeds_many :interpretation, class_name: 'FHIR::CodeableConcept'    
    embeds_many :note, class_name: 'FHIR::Annotation'    
    embeds_one :bodySite, class_name: 'FHIR::CodeableConcept'    
    embeds_one :method, class_name: 'FHIR::CodeableConcept'    
    embeds_one :specimen, class_name: 'FHIR::Reference'    
    embeds_one :device, class_name: 'FHIR::Reference'    
    embeds_many :referenceRange, class_name: 'FHIR::ObservationReferenceRange'    
    embeds_many :hasMember, class_name: 'FHIR::Reference'    
    embeds_many :derivedFrom, class_name: 'FHIR::Reference'    
    embeds_many :component, class_name: 'FHIR::ObservationComponent'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.basedOn.nil?  || !self.basedOn.any? 
        result['basedOn'] = self.basedOn.map{ |x| x.as_json(*args) }
      end
      unless self.partOf.nil?  || !self.partOf.any? 
        result['partOf'] = self.partOf.map{ |x| x.as_json(*args) }
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.category.nil?  || !self.category.any? 
        result['category'] = self.category.map{ |x| x.as_json(*args) }
      end
      unless self.code.nil? 
        result['code'] = self.code.as_json(*args)
      end
      unless self.subject.nil? 
        result['subject'] = self.subject.as_json(*args)
      end
      unless self.focus.nil?  || !self.focus.any? 
        result['focus'] = self.focus.map{ |x| x.as_json(*args) }
      end
      unless self.encounter.nil? 
        result['encounter'] = self.encounter.as_json(*args)
      end
      unless self.effectiveDateTime.nil?
        result['effectiveDateTime'] = self.effectiveDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.effectiveDateTime) 
        result['_effectiveDateTime'] = serialized unless serialized.nil?
      end          
      unless self.effectivePeriod.nil?
        result['effectivePeriod'] = self.effectivePeriod.as_json(*args)                        
      end          
      unless self.effectiveTiming.nil?
        result['effectiveTiming'] = self.effectiveTiming.as_json(*args)                        
      end          
      unless self.effectiveInstant.nil?
        result['effectiveInstant'] = self.effectiveInstant.value                        
        serialized = Extension.serializePrimitiveExtension(self.effectiveInstant) 
        result['_effectiveInstant'] = serialized unless serialized.nil?
      end          
      unless self.issued.nil? 
        result['issued'] = self.issued.value
        serialized = Extension.serializePrimitiveExtension(self.issued)            
        result['_issued'] = serialized unless serialized.nil?
      end
      unless self.performer.nil?  || !self.performer.any? 
        result['performer'] = self.performer.map{ |x| x.as_json(*args) }
      end
      unless self.valueQuantity.nil?
        result['valueQuantity'] = self.valueQuantity.as_json(*args)                        
      end          
      unless self.valueCodeableConcept.nil?
        result['valueCodeableConcept'] = self.valueCodeableConcept.as_json(*args)                        
      end          
      unless self.valueString.nil?
        result['valueString'] = self.valueString.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueString) 
        result['_valueString'] = serialized unless serialized.nil?
      end          
      unless self.valueBoolean.nil?
        result['valueBoolean'] = self.valueBoolean.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueBoolean) 
        result['_valueBoolean'] = serialized unless serialized.nil?
      end          
      unless self.valueInteger.nil?
        result['valueInteger'] = self.valueInteger.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueInteger) 
        result['_valueInteger'] = serialized unless serialized.nil?
      end          
      unless self.valueRange.nil?
        result['valueRange'] = self.valueRange.as_json(*args)                        
      end          
      unless self.valueRatio.nil?
        result['valueRatio'] = self.valueRatio.as_json(*args)                        
      end          
      unless self.valueSampledData.nil?
        result['valueSampledData'] = self.valueSampledData.as_json(*args)                        
      end          
      unless self.valueTime.nil?
        result['valueTime'] = self.valueTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueTime) 
        result['_valueTime'] = serialized unless serialized.nil?
      end          
      unless self.valueDateTime.nil?
        result['valueDateTime'] = self.valueDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueDateTime) 
        result['_valueDateTime'] = serialized unless serialized.nil?
      end          
      unless self.valuePeriod.nil?
        result['valuePeriod'] = self.valuePeriod.as_json(*args)                        
      end          
      unless self.dataAbsentReason.nil? 
        result['dataAbsentReason'] = self.dataAbsentReason.as_json(*args)
      end
      unless self.interpretation.nil?  || !self.interpretation.any? 
        result['interpretation'] = self.interpretation.map{ |x| x.as_json(*args) }
      end
      unless self.note.nil?  || !self.note.any? 
        result['note'] = self.note.map{ |x| x.as_json(*args) }
      end
      unless self.bodySite.nil? 
        result['bodySite'] = self.bodySite.as_json(*args)
      end
      unless self.method.nil? 
        result['method'] = self.method.as_json(*args)
      end
      unless self.specimen.nil? 
        result['specimen'] = self.specimen.as_json(*args)
      end
      unless self.device.nil? 
        result['device'] = self.device.as_json(*args)
      end
      unless self.referenceRange.nil?  || !self.referenceRange.any? 
        result['referenceRange'] = self.referenceRange.map{ |x| x.as_json(*args) }
      end
      unless self.hasMember.nil?  || !self.hasMember.any? 
        result['hasMember'] = self.hasMember.map{ |x| x.as_json(*args) }
      end
      unless self.derivedFrom.nil?  || !self.derivedFrom.any? 
        result['derivedFrom'] = self.derivedFrom.map{ |x| x.as_json(*args) }
      end
      unless self.component.nil?  || !self.component.any? 
        result['component'] = self.component.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Observation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['basedOn'] = json_hash['basedOn'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['basedOn'].nil?
      result['partOf'] = json_hash['partOf'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['partOf'].nil?
      result['status'] = ObservationStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['category'] = json_hash['category'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['category'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?
      result['focus'] = json_hash['focus'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['focus'].nil?
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?
      result['effectiveDateTime'] = PrimitiveDateTime.transform_json(json_hash['effectiveDateTime'], json_hash['_effectiveDateTime']) unless json_hash['effectiveDateTime'].nil?
      result['effectivePeriod'] = Period.transform_json(json_hash['effectivePeriod']) unless json_hash['effectivePeriod'].nil?
      result['effectiveTiming'] = Timing.transform_json(json_hash['effectiveTiming']) unless json_hash['effectiveTiming'].nil?
      result['effectiveInstant'] = PrimitiveInstant.transform_json(json_hash['effectiveInstant'], json_hash['_effectiveInstant']) unless json_hash['effectiveInstant'].nil?
      result['issued'] = PrimitiveInstant.transform_json(json_hash['issued'], json_hash['_issued']) unless json_hash['issued'].nil?
      result['performer'] = json_hash['performer'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['performer'].nil?
      result['valueQuantity'] = Quantity.transform_json(json_hash['valueQuantity']) unless json_hash['valueQuantity'].nil?
      result['valueCodeableConcept'] = CodeableConcept.transform_json(json_hash['valueCodeableConcept']) unless json_hash['valueCodeableConcept'].nil?
      result['valueString'] = PrimitiveString.transform_json(json_hash['valueString'], json_hash['_valueString']) unless json_hash['valueString'].nil?
      result['valueBoolean'] = PrimitiveBoolean.transform_json(json_hash['valueBoolean'], json_hash['_valueBoolean']) unless json_hash['valueBoolean'].nil?
      result['valueInteger'] = PrimitiveInteger.transform_json(json_hash['valueInteger'], json_hash['_valueInteger']) unless json_hash['valueInteger'].nil?
      result['valueRange'] = Range.transform_json(json_hash['valueRange']) unless json_hash['valueRange'].nil?
      result['valueRatio'] = Ratio.transform_json(json_hash['valueRatio']) unless json_hash['valueRatio'].nil?
      result['valueSampledData'] = SampledData.transform_json(json_hash['valueSampledData']) unless json_hash['valueSampledData'].nil?
      result['valueTime'] = PrimitiveTime.transform_json(json_hash['valueTime'], json_hash['_valueTime']) unless json_hash['valueTime'].nil?
      result['valueDateTime'] = PrimitiveDateTime.transform_json(json_hash['valueDateTime'], json_hash['_valueDateTime']) unless json_hash['valueDateTime'].nil?
      result['valuePeriod'] = Period.transform_json(json_hash['valuePeriod']) unless json_hash['valuePeriod'].nil?
      result['dataAbsentReason'] = CodeableConcept.transform_json(json_hash['dataAbsentReason']) unless json_hash['dataAbsentReason'].nil?
      result['interpretation'] = json_hash['interpretation'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['interpretation'].nil?
      result['note'] = json_hash['note'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Annotation.transform_json(var) 
        end
      } unless json_hash['note'].nil?
      result['bodySite'] = CodeableConcept.transform_json(json_hash['bodySite']) unless json_hash['bodySite'].nil?
      result['method'] = CodeableConcept.transform_json(json_hash['method']) unless json_hash['method'].nil?
      result['specimen'] = Reference.transform_json(json_hash['specimen']) unless json_hash['specimen'].nil?
      result['device'] = Reference.transform_json(json_hash['device']) unless json_hash['device'].nil?
      result['referenceRange'] = json_hash['referenceRange'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ObservationReferenceRange.transform_json(var) 
        end
      } unless json_hash['referenceRange'].nil?
      result['hasMember'] = json_hash['hasMember'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['hasMember'].nil?
      result['derivedFrom'] = json_hash['derivedFrom'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['derivedFrom'].nil?
      result['component'] = json_hash['component'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ObservationComponent.transform_json(var) 
        end
      } unless json_hash['component'].nil?

      result
    end
  end
end
