module FHIR
  # fhir/imaging_study.rb
  class ImagingStudy < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::ImagingStudyStatus'    
    embeds_many :modality, class_name: 'FHIR::Coding'    
    embeds_one :subject, class_name: 'FHIR::Reference'    
    embeds_one :encounter, class_name: 'FHIR::Reference'    
    embeds_one :started, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_many :basedOn, class_name: 'FHIR::Reference'    
    embeds_one :referrer, class_name: 'FHIR::Reference'    
    embeds_many :interpreter, class_name: 'FHIR::Reference'    
    embeds_many :endpoint, class_name: 'FHIR::Reference'    
    embeds_one :numberOfSeries, class_name: 'FHIR::PrimitiveUnsignedInt'    
    embeds_one :numberOfInstances, class_name: 'FHIR::PrimitiveUnsignedInt'    
    embeds_one :procedureReference, class_name: 'FHIR::Reference'    
    embeds_many :procedureCode, class_name: 'FHIR::CodeableConcept'    
    embeds_one :location, class_name: 'FHIR::Reference'    
    embeds_many :reasonCode, class_name: 'FHIR::CodeableConcept'    
    embeds_many :reasonReference, class_name: 'FHIR::Reference'    
    embeds_many :note, class_name: 'FHIR::Annotation'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_many :series, class_name: 'FHIR::ImagingStudySeries'    
    
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
      unless self.modality.nil?  || !self.modality.any? 
        result['modality'] = self.modality.map{ |x| x.as_json(*args) }
      end
      unless self.subject.nil? 
        result['subject'] = self.subject.as_json(*args)
      end
      unless self.encounter.nil? 
        result['encounter'] = self.encounter.as_json(*args)
      end
      unless self.started.nil? 
        result['started'] = self.started.value
        serialized = Extension.serializePrimitiveExtension(self.started)            
        result['_started'] = serialized unless serialized.nil?
      end
      unless self.basedOn.nil?  || !self.basedOn.any? 
        result['basedOn'] = self.basedOn.map{ |x| x.as_json(*args) }
      end
      unless self.referrer.nil? 
        result['referrer'] = self.referrer.as_json(*args)
      end
      unless self.interpreter.nil?  || !self.interpreter.any? 
        result['interpreter'] = self.interpreter.map{ |x| x.as_json(*args) }
      end
      unless self.endpoint.nil?  || !self.endpoint.any? 
        result['endpoint'] = self.endpoint.map{ |x| x.as_json(*args) }
      end
      unless self.numberOfSeries.nil? 
        result['numberOfSeries'] = self.numberOfSeries.value
        serialized = Extension.serializePrimitiveExtension(self.numberOfSeries)            
        result['_numberOfSeries'] = serialized unless serialized.nil?
      end
      unless self.numberOfInstances.nil? 
        result['numberOfInstances'] = self.numberOfInstances.value
        serialized = Extension.serializePrimitiveExtension(self.numberOfInstances)            
        result['_numberOfInstances'] = serialized unless serialized.nil?
      end
      unless self.procedureReference.nil? 
        result['procedureReference'] = self.procedureReference.as_json(*args)
      end
      unless self.procedureCode.nil?  || !self.procedureCode.any? 
        result['procedureCode'] = self.procedureCode.map{ |x| x.as_json(*args) }
      end
      unless self.location.nil? 
        result['location'] = self.location.as_json(*args)
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
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.series.nil?  || !self.series.any? 
        result['series'] = self.series.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ImagingStudy.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = ImagingStudyStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['modality'] = json_hash['modality'].map { |var| Coding.transform_json(var) } unless json_hash['modality'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?
      result['started'] = PrimitiveDateTime.transform_json(json_hash['started'], json_hash['_started']) unless json_hash['started'].nil?
      result['basedOn'] = json_hash['basedOn'].map { |var| Reference.transform_json(var) } unless json_hash['basedOn'].nil?
      result['referrer'] = Reference.transform_json(json_hash['referrer']) unless json_hash['referrer'].nil?
      result['interpreter'] = json_hash['interpreter'].map { |var| Reference.transform_json(var) } unless json_hash['interpreter'].nil?
      result['endpoint'] = json_hash['endpoint'].map { |var| Reference.transform_json(var) } unless json_hash['endpoint'].nil?
      result['numberOfSeries'] = PrimitiveUnsignedInt.transform_json(json_hash['numberOfSeries'], json_hash['_numberOfSeries']) unless json_hash['numberOfSeries'].nil?
      result['numberOfInstances'] = PrimitiveUnsignedInt.transform_json(json_hash['numberOfInstances'], json_hash['_numberOfInstances']) unless json_hash['numberOfInstances'].nil?
      result['procedureReference'] = Reference.transform_json(json_hash['procedureReference']) unless json_hash['procedureReference'].nil?
      result['procedureCode'] = json_hash['procedureCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['procedureCode'].nil?
      result['location'] = Reference.transform_json(json_hash['location']) unless json_hash['location'].nil?
      result['reasonCode'] = json_hash['reasonCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reasonCode'].nil?
      result['reasonReference'] = json_hash['reasonReference'].map { |var| Reference.transform_json(var) } unless json_hash['reasonReference'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['series'] = json_hash['series'].map { |var| ImagingStudySeries.transform_json(var) } unless json_hash['series'].nil?

      result
    end
  end
end
