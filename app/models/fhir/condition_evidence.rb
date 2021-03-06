module FHIR
  # fhir/condition_evidence.rb
  class ConditionEvidence < BackboneElement
    include Mongoid::Document
    embeds_many :code, class_name: 'FHIR::CodeableConcept'    
    embeds_many :detail, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.code.nil?  || !self.code.any? 
        result['code'] = self.code.map{ |x| x.as_json(*args) }
      end
      unless self.detail.nil?  || !self.detail.any? 
        result['detail'] = self.detail.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ConditionEvidence.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = json_hash['code'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['code'].nil?
      result['detail'] = json_hash['detail'].map { |var| Reference.transform_json(var) } unless json_hash['detail'].nil?

      result
    end
  end
end
