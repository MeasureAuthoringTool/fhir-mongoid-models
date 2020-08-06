module FHIR
  # fhir/test_report_participant.rb
  class TestReportParticipant < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::TestReportParticipantType'    
    embeds_one :uri, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :display, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
      end
      unless self.uri.nil? 
        result['uri'] = self.uri.value
        serialized = Extension.serializePrimitiveExtension(self.uri)            
        result['_uri'] = serialized unless serialized.nil?
      end
      unless self.display.nil? 
        result['display'] = self.display.value
        serialized = Extension.serializePrimitiveExtension(self.display)            
        result['_display'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = TestReportParticipant.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = TestReportParticipantType.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['uri'] = PrimitiveUri.transform_json(json_hash['uri'], json_hash['_uri']) unless json_hash['uri'].nil?
      result['display'] = PrimitiveString.transform_json(json_hash['display'], json_hash['_display']) unless json_hash['display'].nil?

      result
    end
  end
end
