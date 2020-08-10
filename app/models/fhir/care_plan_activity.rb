module FHIR
  # fhir/care_plan_activity.rb
  class CarePlanActivity < BackboneElement
    include Mongoid::Document
    embeds_many :outcomeCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_many :outcomeReference, class_name: 'FHIR::Reference'    
    embeds_many :progress, class_name: 'FHIR::Annotation'    
    embeds_one :reference, class_name: 'FHIR::Reference'    
    embeds_one :detail, class_name: 'FHIR::CarePlanActivityDetail'    
    
    def as_json(*args)
      result = super      
      unless self.outcomeCodeableConcept.nil?  || !self.outcomeCodeableConcept.any? 
        result['outcomeCodeableConcept'] = self.outcomeCodeableConcept.map{ |x| x.as_json(*args) }
      end
      unless self.outcomeReference.nil?  || !self.outcomeReference.any? 
        result['outcomeReference'] = self.outcomeReference.map{ |x| x.as_json(*args) }
      end
      unless self.progress.nil?  || !self.progress.any? 
        result['progress'] = self.progress.map{ |x| x.as_json(*args) }
      end
      unless self.reference.nil? 
        result['reference'] = self.reference.as_json(*args)
      end
      unless self.detail.nil? 
        result['detail'] = self.detail.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = CarePlanActivity.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['outcomeCodeableConcept'] = json_hash['outcomeCodeableConcept'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['outcomeCodeableConcept'].nil?
      result['outcomeReference'] = json_hash['outcomeReference'].map { |var| Reference.transform_json(var) } unless json_hash['outcomeReference'].nil?
      result['progress'] = json_hash['progress'].map { |var| Annotation.transform_json(var) } unless json_hash['progress'].nil?
      result['reference'] = Reference.transform_json(json_hash['reference']) unless json_hash['reference'].nil?
      result['detail'] = CarePlanActivityDetail.transform_json(json_hash['detail']) unless json_hash['detail'].nil?

      result
    end
  end
end
