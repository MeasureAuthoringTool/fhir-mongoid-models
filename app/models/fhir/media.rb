module FHIR
  # fhir/media.rb
  class Media < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_many :basedOn, class_name: 'FHIR::Reference'    
    embeds_many :partOf, class_name: 'FHIR::Reference'    
    embeds_one :status, class_name: 'FHIR::MediaStatus'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :modality, class_name: 'FHIR::CodeableConcept'    
    embeds_one :view, class_name: 'FHIR::CodeableConcept'    
    embeds_one :subject, class_name: 'FHIR::Reference'    
    embeds_one :encounter, class_name: 'FHIR::Reference'    
    embeds_one :createdDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :createdPeriod, class_name: 'FHIR::Period'    
    embeds_one :issued, class_name: 'FHIR::PrimitiveInstant'    
    embeds_one :operator, class_name: 'FHIR::Reference'    
    embeds_many :reasonCode, class_name: 'FHIR::CodeableConcept'    
    embeds_one :bodySite, class_name: 'FHIR::CodeableConcept'    
    embeds_one :deviceName, class_name: 'FHIR::PrimitiveString'    
    embeds_one :device, class_name: 'FHIR::Reference'    
    embeds_one :height, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_one :width, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_one :frames, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_one :duration, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :content, class_name: 'FHIR::Attachment'    
    embeds_many :note, class_name: 'FHIR::Annotation'    
    
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
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.modality.nil? 
        result['modality'] = self.modality.as_json(*args)
      end
      unless self.view.nil? 
        result['view'] = self.view.as_json(*args)
      end
      unless self.subject.nil? 
        result['subject'] = self.subject.as_json(*args)
      end
      unless self.encounter.nil? 
        result['encounter'] = self.encounter.as_json(*args)
      end
      unless self.createdDateTime.nil?
        result['createdDateTime'] = self.createdDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.createdDateTime) 
        result['_createdDateTime'] = serialized unless serialized.nil?
      end          
      unless self.createdPeriod.nil?
        result['createdPeriod'] = self.createdPeriod.as_json(*args)                        
      end          
      unless self.issued.nil? 
        result['issued'] = self.issued.value
        serialized = Extension.serializePrimitiveExtension(self.issued)            
        result['_issued'] = serialized unless serialized.nil?
      end
      unless self.operator.nil? 
        result['operator'] = self.operator.as_json(*args)
      end
      unless self.reasonCode.nil?  || !self.reasonCode.any? 
        result['reasonCode'] = self.reasonCode.map{ |x| x.as_json(*args) }
      end
      unless self.bodySite.nil? 
        result['bodySite'] = self.bodySite.as_json(*args)
      end
      unless self.deviceName.nil? 
        result['deviceName'] = self.deviceName.value
        serialized = Extension.serializePrimitiveExtension(self.deviceName)            
        result['_deviceName'] = serialized unless serialized.nil?
      end
      unless self.device.nil? 
        result['device'] = self.device.as_json(*args)
      end
      unless self.height.nil? 
        result['height'] = self.height.value
        serialized = Extension.serializePrimitiveExtension(self.height)            
        result['_height'] = serialized unless serialized.nil?
      end
      unless self.width.nil? 
        result['width'] = self.width.value
        serialized = Extension.serializePrimitiveExtension(self.width)            
        result['_width'] = serialized unless serialized.nil?
      end
      unless self.frames.nil? 
        result['frames'] = self.frames.value
        serialized = Extension.serializePrimitiveExtension(self.frames)            
        result['_frames'] = serialized unless serialized.nil?
      end
      unless self.duration.nil? 
        result['duration'] = self.duration.value
        serialized = Extension.serializePrimitiveExtension(self.duration)            
        result['_duration'] = serialized unless serialized.nil?
      end
      unless self.content.nil? 
        result['content'] = self.content.as_json(*args)
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

    def self.transform_json(json_hash, target = Media.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['basedOn'] = json_hash['basedOn'].map { |var| Reference.transform_json(var) } unless json_hash['basedOn'].nil?
      result['partOf'] = json_hash['partOf'].map { |var| Reference.transform_json(var) } unless json_hash['partOf'].nil?
      result['status'] = MediaStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['modality'] = CodeableConcept.transform_json(json_hash['modality']) unless json_hash['modality'].nil?
      result['view'] = CodeableConcept.transform_json(json_hash['view']) unless json_hash['view'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?
      result['createdDateTime'] = PrimitiveDateTime.transform_json(json_hash['createdDateTime'], json_hash['_createdDateTime']) unless json_hash['createdDateTime'].nil?
      result['createdPeriod'] = Period.transform_json(json_hash['createdPeriod']) unless json_hash['createdPeriod'].nil?
      result['issued'] = PrimitiveInstant.transform_json(json_hash['issued'], json_hash['_issued']) unless json_hash['issued'].nil?
      result['operator'] = Reference.transform_json(json_hash['operator']) unless json_hash['operator'].nil?
      result['reasonCode'] = json_hash['reasonCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reasonCode'].nil?
      result['bodySite'] = CodeableConcept.transform_json(json_hash['bodySite']) unless json_hash['bodySite'].nil?
      result['deviceName'] = PrimitiveString.transform_json(json_hash['deviceName'], json_hash['_deviceName']) unless json_hash['deviceName'].nil?
      result['device'] = Reference.transform_json(json_hash['device']) unless json_hash['device'].nil?
      result['height'] = PrimitivePositiveInt.transform_json(json_hash['height'], json_hash['_height']) unless json_hash['height'].nil?
      result['width'] = PrimitivePositiveInt.transform_json(json_hash['width'], json_hash['_width']) unless json_hash['width'].nil?
      result['frames'] = PrimitivePositiveInt.transform_json(json_hash['frames'], json_hash['_frames']) unless json_hash['frames'].nil?
      result['duration'] = PrimitiveDecimal.transform_json(json_hash['duration'], json_hash['_duration']) unless json_hash['duration'].nil?
      result['content'] = Attachment.transform_json(json_hash['content']) unless json_hash['content'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?

      result
    end
  end
end
