module FHIR
  # fhir/questionnaire_response_item.rb
  class QuestionnaireResponseItem < BackboneElement
    include Mongoid::Document
    embeds_one :linkId, class_name: 'FHIR::PrimitiveString'    
    embeds_one :definition, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :text, class_name: 'FHIR::PrimitiveString'    
    embeds_many :answer, class_name: 'FHIR::QuestionnaireResponseItemAnswer'    
    embeds_many :item, class_name: 'FHIR::QuestionnaireResponseItem'    
    
    def as_json(*args)
      result = super      
      unless self.linkId.nil? 
        result['linkId'] = self.linkId.value
        serialized = Extension.serializePrimitiveExtension(self.linkId)            
        result['_linkId'] = serialized unless serialized.nil?
      end
      unless self.definition.nil? 
        result['definition'] = self.definition.value
        serialized = Extension.serializePrimitiveExtension(self.definition)            
        result['_definition'] = serialized unless serialized.nil?
      end
      unless self.text.nil? 
        result['text'] = self.text.value
        serialized = Extension.serializePrimitiveExtension(self.text)            
        result['_text'] = serialized unless serialized.nil?
      end
      unless self.answer.nil?  || !self.answer.any? 
        result['answer'] = self.answer.map{ |x| x.as_json(*args) }
      end
      unless self.item.nil?  || !self.item.any? 
        result['item'] = self.item.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = QuestionnaireResponseItem.new)
      result = self.superclass.transform_json(json_hash, target)
      result['linkId'] = PrimitiveString.transform_json(json_hash['linkId'], json_hash['_linkId']) unless json_hash['linkId'].nil?
      result['definition'] = PrimitiveUri.transform_json(json_hash['definition'], json_hash['_definition']) unless json_hash['definition'].nil?
      result['text'] = PrimitiveString.transform_json(json_hash['text'], json_hash['_text']) unless json_hash['text'].nil?
      result['answer'] = json_hash['answer'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          QuestionnaireResponseItemAnswer.transform_json(var) 
        end
      } unless json_hash['answer'].nil?
      result['item'] = json_hash['item'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          QuestionnaireResponseItem.transform_json(var) 
        end
      } unless json_hash['item'].nil?

      result
    end
  end
end
