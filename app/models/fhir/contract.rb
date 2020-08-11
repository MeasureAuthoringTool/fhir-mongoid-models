module FHIR
  # fhir/contract.rb
  class Contract < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :url, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :version, class_name: 'FHIR::PrimitiveString'    
    embeds_one :status, class_name: 'FHIR::ContractStatus'    
    embeds_one :legalState, class_name: 'FHIR::CodeableConcept'    
    embeds_one :instantiatesCanonical, class_name: 'FHIR::Reference'    
    embeds_one :instantiatesUri, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :contentDerivative, class_name: 'FHIR::CodeableConcept'    
    embeds_one :issued, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :applies, class_name: 'FHIR::Period'    
    embeds_one :expirationType, class_name: 'FHIR::CodeableConcept'    
    embeds_many :subject, class_name: 'FHIR::Reference'    
    embeds_many :authority, class_name: 'FHIR::Reference'    
    embeds_many :domain, class_name: 'FHIR::Reference'    
    embeds_many :site, class_name: 'FHIR::Reference'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :title, class_name: 'FHIR::PrimitiveString'    
    embeds_one :subtitle, class_name: 'FHIR::PrimitiveString'    
    embeds_many :alias, class_name: 'FHIR::PrimitiveString'    
    embeds_one :author, class_name: 'FHIR::Reference'    
    embeds_one :scope, class_name: 'FHIR::CodeableConcept'    
    embeds_one :topicCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :topicReference, class_name: 'FHIR::Reference'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_many :subType, class_name: 'FHIR::CodeableConcept'    
    embeds_one :contentDefinition, class_name: 'FHIR::ContractContentDefinition'    
    embeds_many :term, class_name: 'FHIR::ContractTerm'    
    embeds_many :supportingInfo, class_name: 'FHIR::Reference'    
    embeds_many :relevantHistory, class_name: 'FHIR::Reference'    
    embeds_many :signer, class_name: 'FHIR::ContractSigner'    
    embeds_many :friendly, class_name: 'FHIR::ContractFriendly'    
    embeds_many :legal, class_name: 'FHIR::ContractLegal'    
    embeds_many :rule, class_name: 'FHIR::ContractRule'    
    embeds_one :legallyBindingAttachment, class_name: 'FHIR::Attachment'    
    embeds_one :legallyBindingReference, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.url.nil? 
        result['url'] = self.url.value
        serialized = Extension.serializePrimitiveExtension(self.url)            
        result['_url'] = serialized unless serialized.nil?
      end
      unless self.version.nil? 
        result['version'] = self.version.value
        serialized = Extension.serializePrimitiveExtension(self.version)            
        result['_version'] = serialized unless serialized.nil?
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.legalState.nil? 
        result['legalState'] = self.legalState.as_json(*args)
      end
      unless self.instantiatesCanonical.nil? 
        result['instantiatesCanonical'] = self.instantiatesCanonical.as_json(*args)
      end
      unless self.instantiatesUri.nil? 
        result['instantiatesUri'] = self.instantiatesUri.value
        serialized = Extension.serializePrimitiveExtension(self.instantiatesUri)            
        result['_instantiatesUri'] = serialized unless serialized.nil?
      end
      unless self.contentDerivative.nil? 
        result['contentDerivative'] = self.contentDerivative.as_json(*args)
      end
      unless self.issued.nil? 
        result['issued'] = self.issued.value
        serialized = Extension.serializePrimitiveExtension(self.issued)            
        result['_issued'] = serialized unless serialized.nil?
      end
      unless self.applies.nil? 
        result['applies'] = self.applies.as_json(*args)
      end
      unless self.expirationType.nil? 
        result['expirationType'] = self.expirationType.as_json(*args)
      end
      unless self.subject.nil?  || !self.subject.any? 
        result['subject'] = self.subject.map{ |x| x.as_json(*args) }
      end
      unless self.authority.nil?  || !self.authority.any? 
        result['authority'] = self.authority.map{ |x| x.as_json(*args) }
      end
      unless self.domain.nil?  || !self.domain.any? 
        result['domain'] = self.domain.map{ |x| x.as_json(*args) }
      end
      unless self.site.nil?  || !self.site.any? 
        result['site'] = self.site.map{ |x| x.as_json(*args) }
      end
      unless self.name.nil? 
        result['name'] = self.name.value
        serialized = Extension.serializePrimitiveExtension(self.name)            
        result['_name'] = serialized unless serialized.nil?
      end
      unless self.title.nil? 
        result['title'] = self.title.value
        serialized = Extension.serializePrimitiveExtension(self.title)            
        result['_title'] = serialized unless serialized.nil?
      end
      unless self.subtitle.nil? 
        result['subtitle'] = self.subtitle.value
        serialized = Extension.serializePrimitiveExtension(self.subtitle)            
        result['_subtitle'] = serialized unless serialized.nil?
      end
      unless self.alias.nil?  || !self.alias.any? 
        result['alias'] = self.alias.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.alias)                              
        result['_alias'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.author.nil? 
        result['author'] = self.author.as_json(*args)
      end
      unless self.scope.nil? 
        result['scope'] = self.scope.as_json(*args)
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
      unless self.subType.nil?  || !self.subType.any? 
        result['subType'] = self.subType.map{ |x| x.as_json(*args) }
      end
      unless self.contentDefinition.nil? 
        result['contentDefinition'] = self.contentDefinition.as_json(*args)
      end
      unless self.term.nil?  || !self.term.any? 
        result['term'] = self.term.map{ |x| x.as_json(*args) }
      end
      unless self.supportingInfo.nil?  || !self.supportingInfo.any? 
        result['supportingInfo'] = self.supportingInfo.map{ |x| x.as_json(*args) }
      end
      unless self.relevantHistory.nil?  || !self.relevantHistory.any? 
        result['relevantHistory'] = self.relevantHistory.map{ |x| x.as_json(*args) }
      end
      unless self.signer.nil?  || !self.signer.any? 
        result['signer'] = self.signer.map{ |x| x.as_json(*args) }
      end
      unless self.friendly.nil?  || !self.friendly.any? 
        result['friendly'] = self.friendly.map{ |x| x.as_json(*args) }
      end
      unless self.legal.nil?  || !self.legal.any? 
        result['legal'] = self.legal.map{ |x| x.as_json(*args) }
      end
      unless self.rule.nil?  || !self.rule.any? 
        result['rule'] = self.rule.map{ |x| x.as_json(*args) }
      end
      unless self.legallyBindingAttachment.nil?
        result['legallyBindingAttachment'] = self.legallyBindingAttachment.as_json(*args)                        
      end          
      unless self.legallyBindingReference.nil?
        result['legallyBindingReference'] = self.legallyBindingReference.as_json(*args)                        
      end          
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Contract.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?
      result['status'] = ContractStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['legalState'] = CodeableConcept.transform_json(json_hash['legalState']) unless json_hash['legalState'].nil?
      result['instantiatesCanonical'] = Reference.transform_json(json_hash['instantiatesCanonical']) unless json_hash['instantiatesCanonical'].nil?
      result['instantiatesUri'] = PrimitiveUri.transform_json(json_hash['instantiatesUri'], json_hash['_instantiatesUri']) unless json_hash['instantiatesUri'].nil?
      result['contentDerivative'] = CodeableConcept.transform_json(json_hash['contentDerivative']) unless json_hash['contentDerivative'].nil?
      result['issued'] = PrimitiveDateTime.transform_json(json_hash['issued'], json_hash['_issued']) unless json_hash['issued'].nil?
      result['applies'] = Period.transform_json(json_hash['applies']) unless json_hash['applies'].nil?
      result['expirationType'] = CodeableConcept.transform_json(json_hash['expirationType']) unless json_hash['expirationType'].nil?
      result['subject'] = json_hash['subject'].map { |var| Reference.transform_json(var) } unless json_hash['subject'].nil?
      result['authority'] = json_hash['authority'].map { |var| Reference.transform_json(var) } unless json_hash['authority'].nil?
      result['domain'] = json_hash['domain'].map { |var| Reference.transform_json(var) } unless json_hash['domain'].nil?
      result['site'] = json_hash['site'].map { |var| Reference.transform_json(var) } unless json_hash['site'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?
      result['subtitle'] = PrimitiveString.transform_json(json_hash['subtitle'], json_hash['_subtitle']) unless json_hash['subtitle'].nil?
      result['alias'] = json_hash['alias'].each_with_index.map do |var, i|
        extension_hash = json_hash['_alias'] && json_hash['_alias'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['alias'].nil?
      result['author'] = Reference.transform_json(json_hash['author']) unless json_hash['author'].nil?
      result['scope'] = CodeableConcept.transform_json(json_hash['scope']) unless json_hash['scope'].nil?
      result['topicCodeableConcept'] = CodeableConcept.transform_json(json_hash['topicCodeableConcept']) unless json_hash['topicCodeableConcept'].nil?
      result['topicReference'] = Reference.transform_json(json_hash['topicReference']) unless json_hash['topicReference'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['subType'] = json_hash['subType'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['subType'].nil?
      result['contentDefinition'] = ContractContentDefinition.transform_json(json_hash['contentDefinition']) unless json_hash['contentDefinition'].nil?
      result['term'] = json_hash['term'].map { |var| ContractTerm.transform_json(var) } unless json_hash['term'].nil?
      result['supportingInfo'] = json_hash['supportingInfo'].map { |var| Reference.transform_json(var) } unless json_hash['supportingInfo'].nil?
      result['relevantHistory'] = json_hash['relevantHistory'].map { |var| Reference.transform_json(var) } unless json_hash['relevantHistory'].nil?
      result['signer'] = json_hash['signer'].map { |var| ContractSigner.transform_json(var) } unless json_hash['signer'].nil?
      result['friendly'] = json_hash['friendly'].map { |var| ContractFriendly.transform_json(var) } unless json_hash['friendly'].nil?
      result['legal'] = json_hash['legal'].map { |var| ContractLegal.transform_json(var) } unless json_hash['legal'].nil?
      result['rule'] = json_hash['rule'].map { |var| ContractRule.transform_json(var) } unless json_hash['rule'].nil?
      result['legallyBindingAttachment'] = Attachment.transform_json(json_hash['legallyBindingAttachment']) unless json_hash['legallyBindingAttachment'].nil?
      result['legallyBindingReference'] = Reference.transform_json(json_hash['legallyBindingReference']) unless json_hash['legallyBindingReference'].nil?

      result
    end
  end
end
