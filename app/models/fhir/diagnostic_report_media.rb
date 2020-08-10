module FHIR
  # fhir/diagnostic_report_media.rb
  class DiagnosticReportMedia < BackboneElement
    include Mongoid::Document
    embeds_one :comment, class_name: 'FHIR::PrimitiveString'    
    embeds_one :link, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.comment.nil? 
        result['comment'] = self.comment.value
        serialized = Extension.serializePrimitiveExtension(self.comment)            
        result['_comment'] = serialized unless serialized.nil?
      end
      unless self.link.nil? 
        result['link'] = self.link.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = DiagnosticReportMedia.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['comment'] = PrimitiveString.transform_json(json_hash['comment'], json_hash['_comment']) unless json_hash['comment'].nil?
      result['link'] = Reference.transform_json(json_hash['link']) unless json_hash['link'].nil?

      result
    end
  end
end
