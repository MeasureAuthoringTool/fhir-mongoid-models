module FHIR
  # fhir/measure_report_group_stratifier.rb
  class MeasureReportGroupStratifier < BackboneElement
    include Mongoid::Document
    embeds_many :code, class_name: 'FHIR::CodeableConcept'    
    embeds_many :stratum, class_name: 'FHIR::MeasureReportGroupStratifierStratum'    
    
    def as_json(*args)
      result = super      
      unless self.code.nil?  || !self.code.any? 
        result['code'] = self.code.map{ |x| x.as_json(*args) }
      end
      unless self.stratum.nil?  || !self.stratum.any? 
        result['stratum'] = self.stratum.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MeasureReportGroupStratifier.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = json_hash['code'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['code'].nil?
      result['stratum'] = json_hash['stratum'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          MeasureReportGroupStratifierStratum.transform_json(var) 
        end
      } unless json_hash['stratum'].nil?

      result
    end
  end
end
