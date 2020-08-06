module FHIR
  # fhir/contract_term_offer.rb
  class ContractTermOffer < BackboneElement
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_many :party, class_name: 'FHIR::ContractTermOfferParty'    
    embeds_one :topic, class_name: 'FHIR::Reference'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :decision, class_name: 'FHIR::CodeableConcept'    
    embeds_many :decisionMode, class_name: 'FHIR::CodeableConcept'    
    embeds_many :answer, class_name: 'FHIR::ContractTermOfferAnswer'    
    embeds_one :text, class_name: 'FHIR::PrimitiveString'    
    embeds_many :linkId, class_name: 'FHIR::PrimitiveString'    
    embeds_many :securityLabelNumber, class_name: 'FHIR::PrimitiveUnsignedInt'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.party.nil?  || !self.party.any? 
        result['party'] = self.party.map{ |x| x.as_json(*args) }
      end
      unless self.topic.nil? 
        result['topic'] = self.topic.as_json(*args)
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.decision.nil? 
        result['decision'] = self.decision.as_json(*args)
      end
      unless self.decisionMode.nil?  || !self.decisionMode.any? 
        result['decisionMode'] = self.decisionMode.map{ |x| x.as_json(*args) }
      end
      unless self.answer.nil?  || !self.answer.any? 
        result['answer'] = self.answer.map{ |x| x.as_json(*args) }
      end
      unless self.text.nil? 
        result['text'] = self.text.value
        serialized = Extension.serializePrimitiveExtension(self.text)            
        result['_text'] = serialized unless serialized.nil?
      end
      unless self.linkId.nil?  || !self.linkId.any? 
        result['linkId'] = self.linkId.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.linkId)                              
        result['_linkId'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.securityLabelNumber.nil?  || !self.securityLabelNumber.any? 
        result['securityLabelNumber'] = self.securityLabelNumber.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.securityLabelNumber)                              
        result['_securityLabelNumber'] = serialized unless serialized.nil? || !serialized.any?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ContractTermOffer.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['party'] = json_hash['party'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ContractTermOfferParty.transform_json(var) 
        end
      } unless json_hash['party'].nil?
      result['topic'] = Reference.transform_json(json_hash['topic']) unless json_hash['topic'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['decision'] = CodeableConcept.transform_json(json_hash['decision']) unless json_hash['decision'].nil?
      result['decisionMode'] = json_hash['decisionMode'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['decisionMode'].nil?
      result['answer'] = json_hash['answer'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ContractTermOfferAnswer.transform_json(var) 
        end
      } unless json_hash['answer'].nil?
      result['text'] = PrimitiveString.transform_json(json_hash['text'], json_hash['_text']) unless json_hash['text'].nil?
      result['linkId'] = json_hash['linkId'].each_with_index.map do |var, i|
        extension_hash = json_hash['_linkId'] && json_hash['_linkId'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['linkId'].nil?
      result['securityLabelNumber'] = json_hash['securityLabelNumber'].each_with_index.map do |var, i|
        extension_hash = json_hash['_securityLabelNumber'] && json_hash['_securityLabelNumber'][i]
        PrimitiveUnsignedInt.transform_json(var, extension_hash)
      end unless json_hash['securityLabelNumber'].nil?

      result
    end
  end
end
