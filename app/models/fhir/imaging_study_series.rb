module FHIR
  # fhir/imaging_study_series.rb
  class ImagingStudySeries < BackboneElement
    include Mongoid::Document
    embeds_one :uid, class_name: 'FHIR::PrimitiveId'    
    embeds_one :number, class_name: 'FHIR::PrimitiveUnsignedInt'    
    embeds_one :modality, class_name: 'FHIR::Coding'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :numberOfInstances, class_name: 'FHIR::PrimitiveUnsignedInt'    
    embeds_many :endpoint, class_name: 'FHIR::Reference'    
    embeds_one :bodySite, class_name: 'FHIR::Coding'    
    embeds_one :laterality, class_name: 'FHIR::Coding'    
    embeds_many :specimen, class_name: 'FHIR::Reference'    
    embeds_one :started, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_many :performer, class_name: 'FHIR::ImagingStudySeriesPerformer'    
    embeds_many :instance, class_name: 'FHIR::ImagingStudySeriesInstance'    
    
    def as_json(*args)
      result = super      
      unless self.uid.nil? 
        result['uid'] = self.uid.value
        serialized = Extension.serializePrimitiveExtension(self.uid)            
        result['_uid'] = serialized unless serialized.nil?
      end
      unless self.number.nil? 
        result['number'] = self.number.value
        serialized = Extension.serializePrimitiveExtension(self.number)            
        result['_number'] = serialized unless serialized.nil?
      end
      unless self.modality.nil? 
        result['modality'] = self.modality.as_json(*args)
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.numberOfInstances.nil? 
        result['numberOfInstances'] = self.numberOfInstances.value
        serialized = Extension.serializePrimitiveExtension(self.numberOfInstances)            
        result['_numberOfInstances'] = serialized unless serialized.nil?
      end
      unless self.endpoint.nil?  || !self.endpoint.any? 
        result['endpoint'] = self.endpoint.map{ |x| x.as_json(*args) }
      end
      unless self.bodySite.nil? 
        result['bodySite'] = self.bodySite.as_json(*args)
      end
      unless self.laterality.nil? 
        result['laterality'] = self.laterality.as_json(*args)
      end
      unless self.specimen.nil?  || !self.specimen.any? 
        result['specimen'] = self.specimen.map{ |x| x.as_json(*args) }
      end
      unless self.started.nil? 
        result['started'] = self.started.value
        serialized = Extension.serializePrimitiveExtension(self.started)            
        result['_started'] = serialized unless serialized.nil?
      end
      unless self.performer.nil?  || !self.performer.any? 
        result['performer'] = self.performer.map{ |x| x.as_json(*args) }
      end
      unless self.instance.nil?  || !self.instance.any? 
        result['instance'] = self.instance.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ImagingStudySeries.new)
      result = self.superclass.transform_json(json_hash, target)
      result['uid'] = PrimitiveId.transform_json(json_hash['uid'], json_hash['_uid']) unless json_hash['uid'].nil?
      result['number'] = PrimitiveUnsignedInt.transform_json(json_hash['number'], json_hash['_number']) unless json_hash['number'].nil?
      result['modality'] = Coding.transform_json(json_hash['modality']) unless json_hash['modality'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['numberOfInstances'] = PrimitiveUnsignedInt.transform_json(json_hash['numberOfInstances'], json_hash['_numberOfInstances']) unless json_hash['numberOfInstances'].nil?
      result['endpoint'] = json_hash['endpoint'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['endpoint'].nil?
      result['bodySite'] = Coding.transform_json(json_hash['bodySite']) unless json_hash['bodySite'].nil?
      result['laterality'] = Coding.transform_json(json_hash['laterality']) unless json_hash['laterality'].nil?
      result['specimen'] = json_hash['specimen'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['specimen'].nil?
      result['started'] = PrimitiveDateTime.transform_json(json_hash['started'], json_hash['_started']) unless json_hash['started'].nil?
      result['performer'] = json_hash['performer'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ImagingStudySeriesPerformer.transform_json(var) 
        end
      } unless json_hash['performer'].nil?
      result['instance'] = json_hash['instance'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ImagingStudySeriesInstance.transform_json(var) 
        end
      } unless json_hash['instance'].nil?

      result
    end
  end
end
