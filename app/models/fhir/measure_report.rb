module FHIR
  # fhir/measure_report.rb
  class MeasureReport < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::MeasureReportStatus'    
    embeds_one :type, class_name: 'FHIR::MeasureReportType'    
    embeds_one :measure, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_one :subject, class_name: 'FHIR::Reference'    
    embeds_one :date, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :reporter, class_name: 'FHIR::Reference'    
    embeds_one :period, class_name: 'FHIR::Period'    
    embeds_one :improvementNotation, class_name: 'FHIR::CodeableConcept'    
    embeds_many :group, class_name: 'FHIR::MeasureReportGroup'    
    embeds_many :evaluatedResource, class_name: 'FHIR::Reference'    
    
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
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
      end
      unless self.measure.nil? 
        result['measure'] = self.measure.value
        serialized = Extension.serializePrimitiveExtension(self.measure)            
        result['_measure'] = serialized unless serialized.nil?
      end
      unless self.subject.nil? 
        result['subject'] = self.subject.as_json(*args)
      end
      unless self.date.nil? 
        result['date'] = self.date.value
        serialized = Extension.serializePrimitiveExtension(self.date)            
        result['_date'] = serialized unless serialized.nil?
      end
      unless self.reporter.nil? 
        result['reporter'] = self.reporter.as_json(*args)
      end
      unless self.period.nil? 
        result['period'] = self.period.as_json(*args)
      end
      unless self.improvementNotation.nil? 
        result['improvementNotation'] = self.improvementNotation.as_json(*args)
      end
      unless self.group.nil?  || !self.group.any? 
        result['group'] = self.group.map{ |x| x.as_json(*args) }
      end
      unless self.evaluatedResource.nil?  || !self.evaluatedResource.any? 
        result['evaluatedResource'] = self.evaluatedResource.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MeasureReport.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['status'] = MeasureReportStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['type'] = MeasureReportType.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['measure'] = PrimitiveCanonical.transform_json(json_hash['measure'], json_hash['_measure']) unless json_hash['measure'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?
      result['reporter'] = Reference.transform_json(json_hash['reporter']) unless json_hash['reporter'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?
      result['improvementNotation'] = CodeableConcept.transform_json(json_hash['improvementNotation']) unless json_hash['improvementNotation'].nil?
      result['group'] = json_hash['group'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          MeasureReportGroup.transform_json(var) 
        end
      } unless json_hash['group'].nil?
      result['evaluatedResource'] = json_hash['evaluatedResource'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['evaluatedResource'].nil?

      result
    end
  end
end
