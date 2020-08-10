module FHIR
  # fhir/operation_outcome_issue.rb
  class OperationOutcomeIssue < BackboneElement
    include Mongoid::Document
    embeds_one :severity, class_name: 'FHIR::IssueSeverity'    
    embeds_one :code, class_name: 'FHIR::IssueType'    
    embeds_one :details, class_name: 'FHIR::CodeableConcept'    
    embeds_one :diagnostics, class_name: 'FHIR::PrimitiveString'    
    embeds_many :location, class_name: 'FHIR::PrimitiveString'    
    embeds_many :expression, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.severity.nil? 
        result['severity'] = self.severity.value
        serialized = Extension.serializePrimitiveExtension(self.severity)            
        result['_severity'] = serialized unless serialized.nil?
      end
      unless self.code.nil? 
        result['code'] = self.code.value
        serialized = Extension.serializePrimitiveExtension(self.code)            
        result['_code'] = serialized unless serialized.nil?
      end
      unless self.details.nil? 
        result['details'] = self.details.as_json(*args)
      end
      unless self.diagnostics.nil? 
        result['diagnostics'] = self.diagnostics.value
        serialized = Extension.serializePrimitiveExtension(self.diagnostics)            
        result['_diagnostics'] = serialized unless serialized.nil?
      end
      unless self.location.nil?  || !self.location.any? 
        result['location'] = self.location.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.location)                              
        result['_location'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.expression.nil?  || !self.expression.any? 
        result['expression'] = self.expression.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.expression)                              
        result['_expression'] = serialized unless serialized.nil? || !serialized.any?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = OperationOutcomeIssue.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['severity'] = IssueSeverity.transform_json(json_hash['severity'], json_hash['_severity']) unless json_hash['severity'].nil?
      result['code'] = IssueType.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?
      result['details'] = CodeableConcept.transform_json(json_hash['details']) unless json_hash['details'].nil?
      result['diagnostics'] = PrimitiveString.transform_json(json_hash['diagnostics'], json_hash['_diagnostics']) unless json_hash['diagnostics'].nil?
      result['location'] = json_hash['location'].each_with_index.map do |var, i|
        extension_hash = json_hash['_location'] && json_hash['_location'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['location'].nil?
      result['expression'] = json_hash['expression'].each_with_index.map do |var, i|
        extension_hash = json_hash['_expression'] && json_hash['_expression'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['expression'].nil?

      result
    end
  end
end
