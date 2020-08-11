module FHIR
  # fhir/contract_term_asset.rb
  class ContractTermAsset < BackboneElement
    include Mongoid::Document
    embeds_one :scope, class_name: 'FHIR::CodeableConcept'    
    embeds_many :type, class_name: 'FHIR::CodeableConcept'    
    embeds_many :typeReference, class_name: 'FHIR::Reference'    
    embeds_many :subtype, class_name: 'FHIR::CodeableConcept'    
    embeds_one :relationship, class_name: 'FHIR::Coding'    
    embeds_many :context, class_name: 'FHIR::ContractTermAssetContext'    
    embeds_one :condition, class_name: 'FHIR::PrimitiveString'    
    embeds_many :periodType, class_name: 'FHIR::CodeableConcept'    
    embeds_many :period, class_name: 'FHIR::Period'    
    embeds_many :usePeriod, class_name: 'FHIR::Period'    
    embeds_one :text, class_name: 'FHIR::PrimitiveString'    
    embeds_many :linkId, class_name: 'FHIR::PrimitiveString'    
    embeds_many :answer, class_name: 'FHIR::ContractTermOfferAnswer'    
    embeds_many :securityLabelNumber, class_name: 'FHIR::PrimitiveUnsignedInt'    
    embeds_many :valuedItem, class_name: 'FHIR::ContractTermAssetValuedItem'    
    
    def as_json(*args)
      result = super      
      unless self.scope.nil? 
        result['scope'] = self.scope.as_json(*args)
      end
      unless self.type.nil?  || !self.type.any? 
        result['type'] = self.type.map{ |x| x.as_json(*args) }
      end
      unless self.typeReference.nil?  || !self.typeReference.any? 
        result['typeReference'] = self.typeReference.map{ |x| x.as_json(*args) }
      end
      unless self.subtype.nil?  || !self.subtype.any? 
        result['subtype'] = self.subtype.map{ |x| x.as_json(*args) }
      end
      unless self.relationship.nil? 
        result['relationship'] = self.relationship.as_json(*args)
      end
      unless self.context.nil?  || !self.context.any? 
        result['context'] = self.context.map{ |x| x.as_json(*args) }
      end
      unless self.condition.nil? 
        result['condition'] = self.condition.value
        serialized = Extension.serializePrimitiveExtension(self.condition)            
        result['_condition'] = serialized unless serialized.nil?
      end
      unless self.periodType.nil?  || !self.periodType.any? 
        result['periodType'] = self.periodType.map{ |x| x.as_json(*args) }
      end
      unless self.period.nil?  || !self.period.any? 
        result['period'] = self.period.map{ |x| x.as_json(*args) }
      end
      unless self.usePeriod.nil?  || !self.usePeriod.any? 
        result['usePeriod'] = self.usePeriod.map{ |x| x.as_json(*args) }
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
      unless self.answer.nil?  || !self.answer.any? 
        result['answer'] = self.answer.map{ |x| x.as_json(*args) }
      end
      unless self.securityLabelNumber.nil?  || !self.securityLabelNumber.any? 
        result['securityLabelNumber'] = self.securityLabelNumber.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.securityLabelNumber)                              
        result['_securityLabelNumber'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.valuedItem.nil?  || !self.valuedItem.any? 
        result['valuedItem'] = self.valuedItem.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ContractTermAsset.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['scope'] = CodeableConcept.transform_json(json_hash['scope']) unless json_hash['scope'].nil?
      result['type'] = json_hash['type'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['type'].nil?
      result['typeReference'] = json_hash['typeReference'].map { |var| Reference.transform_json(var) } unless json_hash['typeReference'].nil?
      result['subtype'] = json_hash['subtype'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['subtype'].nil?
      result['relationship'] = Coding.transform_json(json_hash['relationship']) unless json_hash['relationship'].nil?
      result['context'] = json_hash['context'].map { |var| ContractTermAssetContext.transform_json(var) } unless json_hash['context'].nil?
      result['condition'] = PrimitiveString.transform_json(json_hash['condition'], json_hash['_condition']) unless json_hash['condition'].nil?
      result['periodType'] = json_hash['periodType'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['periodType'].nil?
      result['period'] = json_hash['period'].map { |var| Period.transform_json(var) } unless json_hash['period'].nil?
      result['usePeriod'] = json_hash['usePeriod'].map { |var| Period.transform_json(var) } unless json_hash['usePeriod'].nil?
      result['text'] = PrimitiveString.transform_json(json_hash['text'], json_hash['_text']) unless json_hash['text'].nil?
      result['linkId'] = json_hash['linkId'].each_with_index.map do |var, i|
        extension_hash = json_hash['_linkId'] && json_hash['_linkId'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['linkId'].nil?
      result['answer'] = json_hash['answer'].map { |var| ContractTermOfferAnswer.transform_json(var) } unless json_hash['answer'].nil?
      result['securityLabelNumber'] = json_hash['securityLabelNumber'].each_with_index.map do |var, i|
        extension_hash = json_hash['_securityLabelNumber'] && json_hash['_securityLabelNumber'][i]
        PrimitiveUnsignedInt.transform_json(var, extension_hash)
      end unless json_hash['securityLabelNumber'].nil?
      result['valuedItem'] = json_hash['valuedItem'].map { |var| ContractTermAssetValuedItem.transform_json(var) } unless json_hash['valuedItem'].nil?

      result
    end
  end
end
