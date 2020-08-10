module FHIR
  # fhir/test_report_setup_action_operation.rb
  class TestReportSetupActionOperation < BackboneElement
    include Mongoid::Document
    embeds_one :result, class_name: 'FHIR::TestReportActionResult'    
    embeds_one :message, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_one :detail, class_name: 'FHIR::PrimitiveUri'    
    
    def as_json(*args)
      result = super      
      unless self.result.nil? 
        result['result'] = self.result.value
        serialized = Extension.serializePrimitiveExtension(self.result)            
        result['_result'] = serialized unless serialized.nil?
      end
      unless self.message.nil? 
        result['message'] = self.message.value
        serialized = Extension.serializePrimitiveExtension(self.message)            
        result['_message'] = serialized unless serialized.nil?
      end
      unless self.detail.nil? 
        result['detail'] = self.detail.value
        serialized = Extension.serializePrimitiveExtension(self.detail)            
        result['_detail'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = TestReportSetupActionOperation.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['result'] = TestReportActionResult.transform_json(json_hash['result'], json_hash['_result']) unless json_hash['result'].nil?
      result['message'] = PrimitiveMarkdown.transform_json(json_hash['message'], json_hash['_message']) unless json_hash['message'].nil?
      result['detail'] = PrimitiveUri.transform_json(json_hash['detail'], json_hash['_detail']) unless json_hash['detail'].nil?

      result
    end
  end
end
