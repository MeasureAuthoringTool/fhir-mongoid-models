module FHIR
  # fhir/questionnaire_item.rb
  class QuestionnaireItem < BackboneElement
    include Mongoid::Document
    embeds_one :linkId, class_name: 'FHIR::PrimitiveString'    
    embeds_one :definition, class_name: 'FHIR::PrimitiveUri'    
    embeds_many :code, class_name: 'FHIR::Coding'    
    embeds_one :prefix, class_name: 'FHIR::PrimitiveString'    
    embeds_one :text, class_name: 'FHIR::PrimitiveString'    
    embeds_one :type, class_name: 'FHIR::QuestionnaireItemType'    
    embeds_many :enableWhen, class_name: 'FHIR::QuestionnaireItemEnableWhen'    
    embeds_one :enableBehavior, class_name: 'FHIR::EnableWhenBehavior'    
    embeds_one :required, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :repeats, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :readOnly, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :maxLength, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :answerValueSet, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_many :answerOption, class_name: 'FHIR::QuestionnaireItemAnswerOption'    
    embeds_many :initial, class_name: 'FHIR::QuestionnaireItemInitial'    
    embeds_many :item, class_name: 'FHIR::QuestionnaireItem'    
    
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
      unless self.code.nil?  || !self.code.any? 
        result['code'] = self.code.map{ |x| x.as_json(*args) }
      end
      unless self.prefix.nil? 
        result['prefix'] = self.prefix.value
        serialized = Extension.serializePrimitiveExtension(self.prefix)            
        result['_prefix'] = serialized unless serialized.nil?
      end
      unless self.text.nil? 
        result['text'] = self.text.value
        serialized = Extension.serializePrimitiveExtension(self.text)            
        result['_text'] = serialized unless serialized.nil?
      end
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
      end
      unless self.enableWhen.nil?  || !self.enableWhen.any? 
        result['enableWhen'] = self.enableWhen.map{ |x| x.as_json(*args) }
      end
      unless self.enableBehavior.nil? 
        result['enableBehavior'] = self.enableBehavior.value
        serialized = Extension.serializePrimitiveExtension(self.enableBehavior)            
        result['_enableBehavior'] = serialized unless serialized.nil?
      end
      unless self.required.nil? 
        result['required'] = self.required.value
        serialized = Extension.serializePrimitiveExtension(self.required)            
        result['_required'] = serialized unless serialized.nil?
      end
      unless self.repeats.nil? 
        result['repeats'] = self.repeats.value
        serialized = Extension.serializePrimitiveExtension(self.repeats)            
        result['_repeats'] = serialized unless serialized.nil?
      end
      unless self.readOnly.nil? 
        result['readOnly'] = self.readOnly.value
        serialized = Extension.serializePrimitiveExtension(self.readOnly)            
        result['_readOnly'] = serialized unless serialized.nil?
      end
      unless self.maxLength.nil? 
        result['maxLength'] = self.maxLength.value
        serialized = Extension.serializePrimitiveExtension(self.maxLength)            
        result['_maxLength'] = serialized unless serialized.nil?
      end
      unless self.answerValueSet.nil? 
        result['answerValueSet'] = self.answerValueSet.value
        serialized = Extension.serializePrimitiveExtension(self.answerValueSet)            
        result['_answerValueSet'] = serialized unless serialized.nil?
      end
      unless self.answerOption.nil?  || !self.answerOption.any? 
        result['answerOption'] = self.answerOption.map{ |x| x.as_json(*args) }
      end
      unless self.initial.nil?  || !self.initial.any? 
        result['initial'] = self.initial.map{ |x| x.as_json(*args) }
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

    def self.transform_json(json_hash, target = QuestionnaireItem.new)
      result = self.superclass.transform_json(json_hash, target)
      result['linkId'] = PrimitiveString.transform_json(json_hash['linkId'], json_hash['_linkId']) unless json_hash['linkId'].nil?
      result['definition'] = PrimitiveUri.transform_json(json_hash['definition'], json_hash['_definition']) unless json_hash['definition'].nil?
      result['code'] = json_hash['code'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Coding.transform_json(var) 
        end
      } unless json_hash['code'].nil?
      result['prefix'] = PrimitiveString.transform_json(json_hash['prefix'], json_hash['_prefix']) unless json_hash['prefix'].nil?
      result['text'] = PrimitiveString.transform_json(json_hash['text'], json_hash['_text']) unless json_hash['text'].nil?
      result['type'] = QuestionnaireItemType.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['enableWhen'] = json_hash['enableWhen'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          QuestionnaireItemEnableWhen.transform_json(var) 
        end
      } unless json_hash['enableWhen'].nil?
      result['enableBehavior'] = EnableWhenBehavior.transform_json(json_hash['enableBehavior'], json_hash['_enableBehavior']) unless json_hash['enableBehavior'].nil?
      result['required'] = PrimitiveBoolean.transform_json(json_hash['required'], json_hash['_required']) unless json_hash['required'].nil?
      result['repeats'] = PrimitiveBoolean.transform_json(json_hash['repeats'], json_hash['_repeats']) unless json_hash['repeats'].nil?
      result['readOnly'] = PrimitiveBoolean.transform_json(json_hash['readOnly'], json_hash['_readOnly']) unless json_hash['readOnly'].nil?
      result['maxLength'] = PrimitiveInteger.transform_json(json_hash['maxLength'], json_hash['_maxLength']) unless json_hash['maxLength'].nil?
      result['answerValueSet'] = PrimitiveCanonical.transform_json(json_hash['answerValueSet'], json_hash['_answerValueSet']) unless json_hash['answerValueSet'].nil?
      result['answerOption'] = json_hash['answerOption'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          QuestionnaireItemAnswerOption.transform_json(var) 
        end
      } unless json_hash['answerOption'].nil?
      result['initial'] = json_hash['initial'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          QuestionnaireItemInitial.transform_json(var) 
        end
      } unless json_hash['initial'].nil?
      result['item'] = json_hash['item'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          QuestionnaireItem.transform_json(var) 
        end
      } unless json_hash['item'].nil?

      result
    end
  end
end
