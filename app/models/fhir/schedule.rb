module FHIR
  # fhir/schedule.rb
  class Schedule < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :active, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_many :serviceCategory, class_name: 'FHIR::CodeableConcept'    
    embeds_many :serviceType, class_name: 'FHIR::CodeableConcept'    
    embeds_many :specialty, class_name: 'FHIR::CodeableConcept'    
    embeds_many :actor, class_name: 'FHIR::Reference'    
    embeds_one :planningHorizon, class_name: 'FHIR::Period'    
    embeds_one :comment, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.active.nil? 
        result['active'] = self.active.value
        serialized = Extension.serializePrimitiveExtension(self.active)            
        result['_active'] = serialized unless serialized.nil?
      end
      unless self.serviceCategory.nil?  || !self.serviceCategory.any? 
        result['serviceCategory'] = self.serviceCategory.map{ |x| x.as_json(*args) }
      end
      unless self.serviceType.nil?  || !self.serviceType.any? 
        result['serviceType'] = self.serviceType.map{ |x| x.as_json(*args) }
      end
      unless self.specialty.nil?  || !self.specialty.any? 
        result['specialty'] = self.specialty.map{ |x| x.as_json(*args) }
      end
      unless self.actor.nil?  || !self.actor.any? 
        result['actor'] = self.actor.map{ |x| x.as_json(*args) }
      end
      unless self.planningHorizon.nil? 
        result['planningHorizon'] = self.planningHorizon.as_json(*args)
      end
      unless self.comment.nil? 
        result['comment'] = self.comment.value
        serialized = Extension.serializePrimitiveExtension(self.comment)            
        result['_comment'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Schedule.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['active'] = PrimitiveBoolean.transform_json(json_hash['active'], json_hash['_active']) unless json_hash['active'].nil?
      result['serviceCategory'] = json_hash['serviceCategory'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['serviceCategory'].nil?
      result['serviceType'] = json_hash['serviceType'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['serviceType'].nil?
      result['specialty'] = json_hash['specialty'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['specialty'].nil?
      result['actor'] = json_hash['actor'].map { |var| Reference.transform_json(var) } unless json_hash['actor'].nil?
      result['planningHorizon'] = Period.transform_json(json_hash['planningHorizon']) unless json_hash['planningHorizon'].nil?
      result['comment'] = PrimitiveString.transform_json(json_hash['comment'], json_hash['_comment']) unless json_hash['comment'].nil?

      result
    end
  end
end
