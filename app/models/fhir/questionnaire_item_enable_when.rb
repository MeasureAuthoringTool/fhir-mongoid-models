module FHIR
  # fhir/questionnaire_item_enable_when.rb
  class QuestionnaireItemEnableWhen < BackboneElement
    include Mongoid::Document
    embeds_one :question, class_name: 'FHIR::PrimitiveString'    
    embeds_one :operator, class_name: 'FHIR::QuestionnaireItemOperator'    
    embeds_one :answerBoolean, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :answerDecimal, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :answerInteger, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :answerDate, class_name: 'FHIR::PrimitiveDate'    
    embeds_one :answerDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :answerTime, class_name: 'FHIR::PrimitiveTime'    
    embeds_one :answerString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :answerCoding, class_name: 'FHIR::Coding'    
    embeds_one :answerQuantity, class_name: 'FHIR::Quantity'    
    embeds_one :answerReference, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.question.nil? 
        result['question'] = self.question.value
        serialized = Extension.serializePrimitiveExtension(self.question)            
        result['_question'] = serialized unless serialized.nil?
      end
      unless self.operator.nil? 
        result['operator'] = self.operator.value
        serialized = Extension.serializePrimitiveExtension(self.operator)            
        result['_operator'] = serialized unless serialized.nil?
      end
      unless self.answerBoolean.nil?
        result['answerBoolean'] = self.answerBoolean.value                        
        serialized = Extension.serializePrimitiveExtension(self.answerBoolean) 
        result['_answerBoolean'] = serialized unless serialized.nil?
      end          
      unless self.answerDecimal.nil?
        result['answerDecimal'] = self.answerDecimal.value                        
        serialized = Extension.serializePrimitiveExtension(self.answerDecimal) 
        result['_answerDecimal'] = serialized unless serialized.nil?
      end          
      unless self.answerInteger.nil?
        result['answerInteger'] = self.answerInteger.value                        
        serialized = Extension.serializePrimitiveExtension(self.answerInteger) 
        result['_answerInteger'] = serialized unless serialized.nil?
      end          
      unless self.answerDate.nil?
        result['answerDate'] = self.answerDate.value                        
        serialized = Extension.serializePrimitiveExtension(self.answerDate) 
        result['_answerDate'] = serialized unless serialized.nil?
      end          
      unless self.answerDateTime.nil?
        result['answerDateTime'] = self.answerDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.answerDateTime) 
        result['_answerDateTime'] = serialized unless serialized.nil?
      end          
      unless self.answerTime.nil?
        result['answerTime'] = self.answerTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.answerTime) 
        result['_answerTime'] = serialized unless serialized.nil?
      end          
      unless self.answerString.nil?
        result['answerString'] = self.answerString.value                        
        serialized = Extension.serializePrimitiveExtension(self.answerString) 
        result['_answerString'] = serialized unless serialized.nil?
      end          
      unless self.answerCoding.nil?
        result['answerCoding'] = self.answerCoding.as_json(*args)                        
      end          
      unless self.answerQuantity.nil?
        result['answerQuantity'] = self.answerQuantity.as_json(*args)                        
      end          
      unless self.answerReference.nil?
        result['answerReference'] = self.answerReference.as_json(*args)                        
      end          
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = QuestionnaireItemEnableWhen.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['question'] = PrimitiveString.transform_json(json_hash['question'], json_hash['_question']) unless json_hash['question'].nil?
      result['operator'] = QuestionnaireItemOperator.transform_json(json_hash['operator'], json_hash['_operator']) unless json_hash['operator'].nil?
      result['answerBoolean'] = PrimitiveBoolean.transform_json(json_hash['answerBoolean'], json_hash['_answerBoolean']) unless json_hash['answerBoolean'].nil?
      result['answerDecimal'] = PrimitiveDecimal.transform_json(json_hash['answerDecimal'], json_hash['_answerDecimal']) unless json_hash['answerDecimal'].nil?
      result['answerInteger'] = PrimitiveInteger.transform_json(json_hash['answerInteger'], json_hash['_answerInteger']) unless json_hash['answerInteger'].nil?
      result['answerDate'] = PrimitiveDate.transform_json(json_hash['answerDate'], json_hash['_answerDate']) unless json_hash['answerDate'].nil?
      result['answerDateTime'] = PrimitiveDateTime.transform_json(json_hash['answerDateTime'], json_hash['_answerDateTime']) unless json_hash['answerDateTime'].nil?
      result['answerTime'] = PrimitiveTime.transform_json(json_hash['answerTime'], json_hash['_answerTime']) unless json_hash['answerTime'].nil?
      result['answerString'] = PrimitiveString.transform_json(json_hash['answerString'], json_hash['_answerString']) unless json_hash['answerString'].nil?
      result['answerCoding'] = Coding.transform_json(json_hash['answerCoding']) unless json_hash['answerCoding'].nil?
      result['answerQuantity'] = Quantity.transform_json(json_hash['answerQuantity']) unless json_hash['answerQuantity'].nil?
      result['answerReference'] = Reference.transform_json(json_hash['answerReference']) unless json_hash['answerReference'].nil?

      result
    end
  end
end
