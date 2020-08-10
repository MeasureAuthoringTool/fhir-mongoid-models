module FHIR
  # fhir/activity_definition.rb
  class ActivityDefinition < DomainResource
    include Mongoid::Document
    embeds_one :url, class_name: 'FHIR::PrimitiveUri'    
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :version, class_name: 'FHIR::PrimitiveString'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :title, class_name: 'FHIR::PrimitiveString'    
    embeds_one :subtitle, class_name: 'FHIR::PrimitiveString'    
    embeds_one :status, class_name: 'FHIR::PublicationStatus'    
    embeds_one :experimental, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :subjectCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :subjectReference, class_name: 'FHIR::Reference'    
    embeds_one :date, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :publisher, class_name: 'FHIR::PrimitiveString'    
    embeds_many :contact, class_name: 'FHIR::ContactDetail'    
    embeds_one :description, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_many :useContext, class_name: 'FHIR::UsageContext'    
    embeds_many :jurisdiction, class_name: 'FHIR::CodeableConcept'    
    embeds_one :purpose, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_one :usage, class_name: 'FHIR::PrimitiveString'    
    embeds_one :copyright, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_one :approvalDate, class_name: 'FHIR::PrimitiveDate'    
    embeds_one :lastReviewDate, class_name: 'FHIR::PrimitiveDate'    
    embeds_one :effectivePeriod, class_name: 'FHIR::Period'    
    embeds_many :topic, class_name: 'FHIR::CodeableConcept'    
    embeds_many :author, class_name: 'FHIR::ContactDetail'    
    embeds_many :editor, class_name: 'FHIR::ContactDetail'    
    embeds_many :reviewer, class_name: 'FHIR::ContactDetail'    
    embeds_many :endorser, class_name: 'FHIR::ContactDetail'    
    embeds_many :relatedArtifact, class_name: 'FHIR::RelatedArtifact'    
    embeds_many :library, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_one :kind, class_name: 'FHIR::ActivityDefinitionKind'    
    embeds_one :profile, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :intent, class_name: 'FHIR::RequestIntent'    
    embeds_one :priority, class_name: 'FHIR::RequestPriority'    
    embeds_one :doNotPerform, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :timingTiming, class_name: 'FHIR::Timing'    
    embeds_one :timingDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :timingAge, class_name: 'FHIR::Age'    
    embeds_one :timingPeriod, class_name: 'FHIR::Period'    
    embeds_one :timingRange, class_name: 'FHIR::Range'    
    embeds_one :timingDuration, class_name: 'FHIR::Duration'    
    embeds_one :location, class_name: 'FHIR::Reference'    
    embeds_many :participant, class_name: 'FHIR::ActivityDefinitionParticipant'    
    embeds_one :productReference, class_name: 'FHIR::Reference'    
    embeds_one :productCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :quantity, class_name: 'FHIR::SimpleQuantity'    
    embeds_many :dosage, class_name: 'FHIR::Dosage'    
    embeds_many :bodySite, class_name: 'FHIR::CodeableConcept'    
    embeds_many :specimenRequirement, class_name: 'FHIR::Reference'    
    embeds_many :observationRequirement, class_name: 'FHIR::Reference'    
    embeds_many :observationResultRequirement, class_name: 'FHIR::Reference'    
    embeds_one :transform, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_many :dynamicValue, class_name: 'FHIR::ActivityDefinitionDynamicValue'    
    
    def as_json(*args)
      result = super      
      unless self.url.nil? 
        result['url'] = self.url.value
        serialized = Extension.serializePrimitiveExtension(self.url)            
        result['_url'] = serialized unless serialized.nil?
      end
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.version.nil? 
        result['version'] = self.version.value
        serialized = Extension.serializePrimitiveExtension(self.version)            
        result['_version'] = serialized unless serialized.nil?
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
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.experimental.nil? 
        result['experimental'] = self.experimental.value
        serialized = Extension.serializePrimitiveExtension(self.experimental)            
        result['_experimental'] = serialized unless serialized.nil?
      end
      unless self.subjectCodeableConcept.nil?
        result['subjectCodeableConcept'] = self.subjectCodeableConcept.as_json(*args)                        
      end          
      unless self.subjectReference.nil?
        result['subjectReference'] = self.subjectReference.as_json(*args)                        
      end          
      unless self.date.nil? 
        result['date'] = self.date.value
        serialized = Extension.serializePrimitiveExtension(self.date)            
        result['_date'] = serialized unless serialized.nil?
      end
      unless self.publisher.nil? 
        result['publisher'] = self.publisher.value
        serialized = Extension.serializePrimitiveExtension(self.publisher)            
        result['_publisher'] = serialized unless serialized.nil?
      end
      unless self.contact.nil?  || !self.contact.any? 
        result['contact'] = self.contact.map{ |x| x.as_json(*args) }
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.useContext.nil?  || !self.useContext.any? 
        result['useContext'] = self.useContext.map{ |x| x.as_json(*args) }
      end
      unless self.jurisdiction.nil?  || !self.jurisdiction.any? 
        result['jurisdiction'] = self.jurisdiction.map{ |x| x.as_json(*args) }
      end
      unless self.purpose.nil? 
        result['purpose'] = self.purpose.value
        serialized = Extension.serializePrimitiveExtension(self.purpose)            
        result['_purpose'] = serialized unless serialized.nil?
      end
      unless self.usage.nil? 
        result['usage'] = self.usage.value
        serialized = Extension.serializePrimitiveExtension(self.usage)            
        result['_usage'] = serialized unless serialized.nil?
      end
      unless self.copyright.nil? 
        result['copyright'] = self.copyright.value
        serialized = Extension.serializePrimitiveExtension(self.copyright)            
        result['_copyright'] = serialized unless serialized.nil?
      end
      unless self.approvalDate.nil? 
        result['approvalDate'] = self.approvalDate.value
        serialized = Extension.serializePrimitiveExtension(self.approvalDate)            
        result['_approvalDate'] = serialized unless serialized.nil?
      end
      unless self.lastReviewDate.nil? 
        result['lastReviewDate'] = self.lastReviewDate.value
        serialized = Extension.serializePrimitiveExtension(self.lastReviewDate)            
        result['_lastReviewDate'] = serialized unless serialized.nil?
      end
      unless self.effectivePeriod.nil? 
        result['effectivePeriod'] = self.effectivePeriod.as_json(*args)
      end
      unless self.topic.nil?  || !self.topic.any? 
        result['topic'] = self.topic.map{ |x| x.as_json(*args) }
      end
      unless self.author.nil?  || !self.author.any? 
        result['author'] = self.author.map{ |x| x.as_json(*args) }
      end
      unless self.editor.nil?  || !self.editor.any? 
        result['editor'] = self.editor.map{ |x| x.as_json(*args) }
      end
      unless self.reviewer.nil?  || !self.reviewer.any? 
        result['reviewer'] = self.reviewer.map{ |x| x.as_json(*args) }
      end
      unless self.endorser.nil?  || !self.endorser.any? 
        result['endorser'] = self.endorser.map{ |x| x.as_json(*args) }
      end
      unless self.relatedArtifact.nil?  || !self.relatedArtifact.any? 
        result['relatedArtifact'] = self.relatedArtifact.map{ |x| x.as_json(*args) }
      end
      unless self.library.nil?  || !self.library.any? 
        result['library'] = self.library.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.library)                              
        result['_library'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.kind.nil? 
        result['kind'] = self.kind.value
        serialized = Extension.serializePrimitiveExtension(self.kind)            
        result['_kind'] = serialized unless serialized.nil?
      end
      unless self.profile.nil? 
        result['profile'] = self.profile.value
        serialized = Extension.serializePrimitiveExtension(self.profile)            
        result['_profile'] = serialized unless serialized.nil?
      end
      unless self.code.nil? 
        result['code'] = self.code.as_json(*args)
      end
      unless self.intent.nil? 
        result['intent'] = self.intent.value
        serialized = Extension.serializePrimitiveExtension(self.intent)            
        result['_intent'] = serialized unless serialized.nil?
      end
      unless self.priority.nil? 
        result['priority'] = self.priority.value
        serialized = Extension.serializePrimitiveExtension(self.priority)            
        result['_priority'] = serialized unless serialized.nil?
      end
      unless self.doNotPerform.nil? 
        result['doNotPerform'] = self.doNotPerform.value
        serialized = Extension.serializePrimitiveExtension(self.doNotPerform)            
        result['_doNotPerform'] = serialized unless serialized.nil?
      end
      unless self.timingTiming.nil?
        result['timingTiming'] = self.timingTiming.as_json(*args)                        
      end          
      unless self.timingDateTime.nil?
        result['timingDateTime'] = self.timingDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.timingDateTime) 
        result['_timingDateTime'] = serialized unless serialized.nil?
      end          
      unless self.timingAge.nil?
        result['timingAge'] = self.timingAge.as_json(*args)                        
      end          
      unless self.timingPeriod.nil?
        result['timingPeriod'] = self.timingPeriod.as_json(*args)                        
      end          
      unless self.timingRange.nil?
        result['timingRange'] = self.timingRange.as_json(*args)                        
      end          
      unless self.timingDuration.nil?
        result['timingDuration'] = self.timingDuration.as_json(*args)                        
      end          
      unless self.location.nil? 
        result['location'] = self.location.as_json(*args)
      end
      unless self.participant.nil?  || !self.participant.any? 
        result['participant'] = self.participant.map{ |x| x.as_json(*args) }
      end
      unless self.productReference.nil?
        result['productReference'] = self.productReference.as_json(*args)                        
      end          
      unless self.productCodeableConcept.nil?
        result['productCodeableConcept'] = self.productCodeableConcept.as_json(*args)                        
      end          
      unless self.quantity.nil? 
        result['quantity'] = self.quantity.as_json(*args)
      end
      unless self.dosage.nil?  || !self.dosage.any? 
        result['dosage'] = self.dosage.map{ |x| x.as_json(*args) }
      end
      unless self.bodySite.nil?  || !self.bodySite.any? 
        result['bodySite'] = self.bodySite.map{ |x| x.as_json(*args) }
      end
      unless self.specimenRequirement.nil?  || !self.specimenRequirement.any? 
        result['specimenRequirement'] = self.specimenRequirement.map{ |x| x.as_json(*args) }
      end
      unless self.observationRequirement.nil?  || !self.observationRequirement.any? 
        result['observationRequirement'] = self.observationRequirement.map{ |x| x.as_json(*args) }
      end
      unless self.observationResultRequirement.nil?  || !self.observationResultRequirement.any? 
        result['observationResultRequirement'] = self.observationResultRequirement.map{ |x| x.as_json(*args) }
      end
      unless self.transform.nil? 
        result['transform'] = self.transform.value
        serialized = Extension.serializePrimitiveExtension(self.transform)            
        result['_transform'] = serialized unless serialized.nil?
      end
      unless self.dynamicValue.nil?  || !self.dynamicValue.any? 
        result['dynamicValue'] = self.dynamicValue.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ActivityDefinition.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?
      result['subtitle'] = PrimitiveString.transform_json(json_hash['subtitle'], json_hash['_subtitle']) unless json_hash['subtitle'].nil?
      result['status'] = PublicationStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['experimental'] = PrimitiveBoolean.transform_json(json_hash['experimental'], json_hash['_experimental']) unless json_hash['experimental'].nil?
      result['subjectCodeableConcept'] = CodeableConcept.transform_json(json_hash['subjectCodeableConcept']) unless json_hash['subjectCodeableConcept'].nil?
      result['subjectReference'] = Reference.transform_json(json_hash['subjectReference']) unless json_hash['subjectReference'].nil?
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?
      result['publisher'] = PrimitiveString.transform_json(json_hash['publisher'], json_hash['_publisher']) unless json_hash['publisher'].nil?
      result['contact'] = json_hash['contact'].map { |var| ContactDetail.transform_json(var) } unless json_hash['contact'].nil?
      result['description'] = PrimitiveMarkdown.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['useContext'] = json_hash['useContext'].map { |var| UsageContext.transform_json(var) } unless json_hash['useContext'].nil?
      result['jurisdiction'] = json_hash['jurisdiction'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['jurisdiction'].nil?
      result['purpose'] = PrimitiveMarkdown.transform_json(json_hash['purpose'], json_hash['_purpose']) unless json_hash['purpose'].nil?
      result['usage'] = PrimitiveString.transform_json(json_hash['usage'], json_hash['_usage']) unless json_hash['usage'].nil?
      result['copyright'] = PrimitiveMarkdown.transform_json(json_hash['copyright'], json_hash['_copyright']) unless json_hash['copyright'].nil?
      result['approvalDate'] = PrimitiveDate.transform_json(json_hash['approvalDate'], json_hash['_approvalDate']) unless json_hash['approvalDate'].nil?
      result['lastReviewDate'] = PrimitiveDate.transform_json(json_hash['lastReviewDate'], json_hash['_lastReviewDate']) unless json_hash['lastReviewDate'].nil?
      result['effectivePeriod'] = Period.transform_json(json_hash['effectivePeriod']) unless json_hash['effectivePeriod'].nil?
      result['topic'] = json_hash['topic'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['topic'].nil?
      result['author'] = json_hash['author'].map { |var| ContactDetail.transform_json(var) } unless json_hash['author'].nil?
      result['editor'] = json_hash['editor'].map { |var| ContactDetail.transform_json(var) } unless json_hash['editor'].nil?
      result['reviewer'] = json_hash['reviewer'].map { |var| ContactDetail.transform_json(var) } unless json_hash['reviewer'].nil?
      result['endorser'] = json_hash['endorser'].map { |var| ContactDetail.transform_json(var) } unless json_hash['endorser'].nil?
      result['relatedArtifact'] = json_hash['relatedArtifact'].map { |var| RelatedArtifact.transform_json(var) } unless json_hash['relatedArtifact'].nil?
      result['library'] = json_hash['library'].each_with_index.map do |var, i|
        extension_hash = json_hash['_library'] && json_hash['_library'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['library'].nil?
      result['kind'] = ActivityDefinitionKind.transform_json(json_hash['kind'], json_hash['_kind']) unless json_hash['kind'].nil?
      result['profile'] = PrimitiveCanonical.transform_json(json_hash['profile'], json_hash['_profile']) unless json_hash['profile'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['intent'] = RequestIntent.transform_json(json_hash['intent'], json_hash['_intent']) unless json_hash['intent'].nil?
      result['priority'] = RequestPriority.transform_json(json_hash['priority'], json_hash['_priority']) unless json_hash['priority'].nil?
      result['doNotPerform'] = PrimitiveBoolean.transform_json(json_hash['doNotPerform'], json_hash['_doNotPerform']) unless json_hash['doNotPerform'].nil?
      result['timingTiming'] = Timing.transform_json(json_hash['timingTiming']) unless json_hash['timingTiming'].nil?
      result['timingDateTime'] = PrimitiveDateTime.transform_json(json_hash['timingDateTime'], json_hash['_timingDateTime']) unless json_hash['timingDateTime'].nil?
      result['timingAge'] = Age.transform_json(json_hash['timingAge']) unless json_hash['timingAge'].nil?
      result['timingPeriod'] = Period.transform_json(json_hash['timingPeriod']) unless json_hash['timingPeriod'].nil?
      result['timingRange'] = Range.transform_json(json_hash['timingRange']) unless json_hash['timingRange'].nil?
      result['timingDuration'] = Duration.transform_json(json_hash['timingDuration']) unless json_hash['timingDuration'].nil?
      result['location'] = Reference.transform_json(json_hash['location']) unless json_hash['location'].nil?
      result['participant'] = json_hash['participant'].map { |var| ActivityDefinitionParticipant.transform_json(var) } unless json_hash['participant'].nil?
      result['productReference'] = Reference.transform_json(json_hash['productReference']) unless json_hash['productReference'].nil?
      result['productCodeableConcept'] = CodeableConcept.transform_json(json_hash['productCodeableConcept']) unless json_hash['productCodeableConcept'].nil?
      result['quantity'] = SimpleQuantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?
      result['dosage'] = json_hash['dosage'].map { |var| Dosage.transform_json(var) } unless json_hash['dosage'].nil?
      result['bodySite'] = json_hash['bodySite'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['bodySite'].nil?
      result['specimenRequirement'] = json_hash['specimenRequirement'].map { |var| Reference.transform_json(var) } unless json_hash['specimenRequirement'].nil?
      result['observationRequirement'] = json_hash['observationRequirement'].map { |var| Reference.transform_json(var) } unless json_hash['observationRequirement'].nil?
      result['observationResultRequirement'] = json_hash['observationResultRequirement'].map { |var| Reference.transform_json(var) } unless json_hash['observationResultRequirement'].nil?
      result['transform'] = PrimitiveCanonical.transform_json(json_hash['transform'], json_hash['_transform']) unless json_hash['transform'].nil?
      result['dynamicValue'] = json_hash['dynamicValue'].map { |var| ActivityDefinitionDynamicValue.transform_json(var) } unless json_hash['dynamicValue'].nil?

      result
    end
  end
end
