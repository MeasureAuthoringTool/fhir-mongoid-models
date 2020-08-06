module FHIR
  # fhir/operation_outcome.rb
  class OperationOutcome < DomainResource
    include Mongoid::Document
    embeds_many :issue, class_name: 'FHIR::OperationOutcomeIssue'    
    
    def as_json(*args)
      result = super      
      unless self.issue.nil?  || !self.issue.any? 
        result['issue'] = self.issue.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = OperationOutcome.new)
      result = self.superclass.transform_json(json_hash, target)
      result['issue'] = json_hash['issue'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          OperationOutcomeIssue.transform_json(var) 
        end
      } unless json_hash['issue'].nil?

      result
    end
  end
end
