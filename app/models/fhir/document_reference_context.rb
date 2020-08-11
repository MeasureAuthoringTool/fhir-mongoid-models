module FHIR
  # fhir/document_reference_context.rb
  class DocumentReferenceContext < BackboneElement
    include Mongoid::Document
    embeds_many :encounter, class_name: 'FHIR::Reference'    
    embeds_many :event, class_name: 'FHIR::CodeableConcept'    
    embeds_one :period, class_name: 'FHIR::Period'    
    embeds_one :facilityType, class_name: 'FHIR::CodeableConcept'    
    embeds_one :practiceSetting, class_name: 'FHIR::CodeableConcept'    
    embeds_one :sourcePatientInfo, class_name: 'FHIR::Reference'    
    embeds_many :related, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.encounter.nil?  || !self.encounter.any? 
        result['encounter'] = self.encounter.map{ |x| x.as_json(*args) }
      end
      unless self.event.nil?  || !self.event.any? 
        result['event'] = self.event.map{ |x| x.as_json(*args) }
      end
      unless self.period.nil? 
        result['period'] = self.period.as_json(*args)
      end
      unless self.facilityType.nil? 
        result['facilityType'] = self.facilityType.as_json(*args)
      end
      unless self.practiceSetting.nil? 
        result['practiceSetting'] = self.practiceSetting.as_json(*args)
      end
      unless self.sourcePatientInfo.nil? 
        result['sourcePatientInfo'] = self.sourcePatientInfo.as_json(*args)
      end
      unless self.related.nil?  || !self.related.any? 
        result['related'] = self.related.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = DocumentReferenceContext.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['encounter'] = json_hash['encounter'].map { |var| Reference.transform_json(var) } unless json_hash['encounter'].nil?
      result['event'] = json_hash['event'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['event'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?
      result['facilityType'] = CodeableConcept.transform_json(json_hash['facilityType']) unless json_hash['facilityType'].nil?
      result['practiceSetting'] = CodeableConcept.transform_json(json_hash['practiceSetting']) unless json_hash['practiceSetting'].nil?
      result['sourcePatientInfo'] = Reference.transform_json(json_hash['sourcePatientInfo']) unless json_hash['sourcePatientInfo'].nil?
      result['related'] = json_hash['related'].map { |var| Reference.transform_json(var) } unless json_hash['related'].nil?

      result
    end
  end
end
