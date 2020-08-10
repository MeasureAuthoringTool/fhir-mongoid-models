module FHIR
  # fhir/explanation_of_benefit_procedure.rb
  class ExplanationOfBenefitProcedure < BackboneElement
    include Mongoid::Document
    embeds_one :sequence, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_many :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :date, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :procedureCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :procedureReference, class_name: 'FHIR::Reference'    
    embeds_many :udi, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.sequence.nil? 
        result['sequence'] = self.sequence.value
        serialized = Extension.serializePrimitiveExtension(self.sequence)            
        result['_sequence'] = serialized unless serialized.nil?
      end
      unless self.type.nil?  || !self.type.any? 
        result['type'] = self.type.map{ |x| x.as_json(*args) }
      end
      unless self.date.nil? 
        result['date'] = self.date.value
        serialized = Extension.serializePrimitiveExtension(self.date)            
        result['_date'] = serialized unless serialized.nil?
      end
      unless self.procedureCodeableConcept.nil?
        result['procedureCodeableConcept'] = self.procedureCodeableConcept.as_json(*args)                        
      end          
      unless self.procedureReference.nil?
        result['procedureReference'] = self.procedureReference.as_json(*args)                        
      end          
      unless self.udi.nil?  || !self.udi.any? 
        result['udi'] = self.udi.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ExplanationOfBenefitProcedure.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['sequence'] = PrimitivePositiveInt.transform_json(json_hash['sequence'], json_hash['_sequence']) unless json_hash['sequence'].nil?
      result['type'] = json_hash['type'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['type'].nil?
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?
      result['procedureCodeableConcept'] = CodeableConcept.transform_json(json_hash['procedureCodeableConcept']) unless json_hash['procedureCodeableConcept'].nil?
      result['procedureReference'] = Reference.transform_json(json_hash['procedureReference']) unless json_hash['procedureReference'].nil?
      result['udi'] = json_hash['udi'].map { |var| Reference.transform_json(var) } unless json_hash['udi'].nil?

      result
    end
  end
end
