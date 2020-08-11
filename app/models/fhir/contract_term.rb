module FHIR
  # fhir/contract_term.rb
  class ContractTerm < BackboneElement
    include Mongoid::Document
    embeds_one :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :issued, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :applies, class_name: 'FHIR::Period'    
    embeds_one :topicCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :topicReference, class_name: 'FHIR::Reference'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :subType, class_name: 'FHIR::CodeableConcept'    
    embeds_one :text, class_name: 'FHIR::PrimitiveString'    
    embeds_many :securityLabel, class_name: 'FHIR::ContractTermSecurityLabel'    
    embeds_one :offer, class_name: 'FHIR::ContractTermOffer'    
    embeds_many :asset, class_name: 'FHIR::ContractTermAsset'    
    embeds_many :action, class_name: 'FHIR::ContractTermAction'    
    embeds_many :group, class_name: 'FHIR::ContractTerm'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil? 
        result['identifier'] = self.identifier.as_json(*args)
      end
      unless self.issued.nil? 
        result['issued'] = self.issued.value
        serialized = Extension.serializePrimitiveExtension(self.issued)            
        result['_issued'] = serialized unless serialized.nil?
      end
      unless self.applies.nil? 
        result['applies'] = self.applies.as_json(*args)
      end
      unless self.topicCodeableConcept.nil?
        result['topicCodeableConcept'] = self.topicCodeableConcept.as_json(*args)                        
      end          
      unless self.topicReference.nil?
        result['topicReference'] = self.topicReference.as_json(*args)                        
      end          
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.subType.nil? 
        result['subType'] = self.subType.as_json(*args)
      end
      unless self.text.nil? 
        result['text'] = self.text.value
        serialized = Extension.serializePrimitiveExtension(self.text)            
        result['_text'] = serialized unless serialized.nil?
      end
      unless self.securityLabel.nil?  || !self.securityLabel.any? 
        result['securityLabel'] = self.securityLabel.map{ |x| x.as_json(*args) }
      end
      unless self.offer.nil? 
        result['offer'] = self.offer.as_json(*args)
      end
      unless self.asset.nil?  || !self.asset.any? 
        result['asset'] = self.asset.map{ |x| x.as_json(*args) }
      end
      unless self.action.nil?  || !self.action.any? 
        result['action'] = self.action.map{ |x| x.as_json(*args) }
      end
      unless self.group.nil?  || !self.group.any? 
        result['group'] = self.group.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ContractTerm.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?
      result['issued'] = PrimitiveDateTime.transform_json(json_hash['issued'], json_hash['_issued']) unless json_hash['issued'].nil?
      result['applies'] = Period.transform_json(json_hash['applies']) unless json_hash['applies'].nil?
      result['topicCodeableConcept'] = CodeableConcept.transform_json(json_hash['topicCodeableConcept']) unless json_hash['topicCodeableConcept'].nil?
      result['topicReference'] = Reference.transform_json(json_hash['topicReference']) unless json_hash['topicReference'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['subType'] = CodeableConcept.transform_json(json_hash['subType']) unless json_hash['subType'].nil?
      result['text'] = PrimitiveString.transform_json(json_hash['text'], json_hash['_text']) unless json_hash['text'].nil?
      result['securityLabel'] = json_hash['securityLabel'].map { |var| ContractTermSecurityLabel.transform_json(var) } unless json_hash['securityLabel'].nil?
      result['offer'] = ContractTermOffer.transform_json(json_hash['offer']) unless json_hash['offer'].nil?
      result['asset'] = json_hash['asset'].map { |var| ContractTermAsset.transform_json(var) } unless json_hash['asset'].nil?
      result['action'] = json_hash['action'].map { |var| ContractTermAction.transform_json(var) } unless json_hash['action'].nil?
      result['group'] = json_hash['group'].map { |var| ContractTerm.transform_json(var) } unless json_hash['group'].nil?

      result
    end
  end
end
