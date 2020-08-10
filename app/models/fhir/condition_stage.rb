module FHIR
  # fhir/condition_stage.rb
  class ConditionStage < BackboneElement
    include Mongoid::Document
    embeds_one :summary, class_name: 'FHIR::CodeableConcept'    
    embeds_many :assessment, class_name: 'FHIR::Reference'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    
    def as_json(*args)
      result = super      
      unless self.summary.nil? 
        result['summary'] = self.summary.as_json(*args)
      end
      unless self.assessment.nil?  || !self.assessment.any? 
        result['assessment'] = self.assessment.map{ |x| x.as_json(*args) }
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ConditionStage.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['summary'] = CodeableConcept.transform_json(json_hash['summary']) unless json_hash['summary'].nil?
      result['assessment'] = json_hash['assessment'].map { |var| Reference.transform_json(var) } unless json_hash['assessment'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?

      result
    end
  end
end
