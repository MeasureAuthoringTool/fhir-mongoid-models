module FHIR
  # fhir/charge_item.rb
  class ChargeItem < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_many :definitionUri, class_name: 'FHIR::PrimitiveUri'    
    embeds_many :definitionCanonical, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_one :status, class_name: 'FHIR::ChargeItemStatus'    
    embeds_many :partOf, class_name: 'FHIR::Reference'    
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :subject, class_name: 'FHIR::Reference'    
    embeds_one :context, class_name: 'FHIR::Reference'    
    embeds_one :occurrenceDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :occurrencePeriod, class_name: 'FHIR::Period'    
    embeds_one :occurrenceTiming, class_name: 'FHIR::Timing'    
    embeds_many :performer, class_name: 'FHIR::ChargeItemPerformer'    
    embeds_one :performingOrganization, class_name: 'FHIR::Reference'    
    embeds_one :requestingOrganization, class_name: 'FHIR::Reference'    
    embeds_one :costCenter, class_name: 'FHIR::Reference'    
    embeds_one :quantity, class_name: 'FHIR::Quantity'    
    embeds_many :bodysite, class_name: 'FHIR::CodeableConcept'    
    embeds_one :factorOverride, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :priceOverride, class_name: 'FHIR::Money'    
    embeds_one :overrideReason, class_name: 'FHIR::PrimitiveString'    
    embeds_one :enterer, class_name: 'FHIR::Reference'    
    embeds_one :enteredDate, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_many :reason, class_name: 'FHIR::CodeableConcept'    
    embeds_many :service, class_name: 'FHIR::Reference'    
    embeds_one :productReference, class_name: 'FHIR::Reference'    
    embeds_one :productCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_many :account, class_name: 'FHIR::Reference'    
    embeds_many :note, class_name: 'FHIR::Annotation'    
    embeds_many :supportingInformation, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.definitionUri.nil?  || !self.definitionUri.any? 
        result['definitionUri'] = self.definitionUri.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.definitionUri)                              
        result['_definitionUri'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.definitionCanonical.nil?  || !self.definitionCanonical.any? 
        result['definitionCanonical'] = self.definitionCanonical.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.definitionCanonical)                              
        result['_definitionCanonical'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.partOf.nil?  || !self.partOf.any? 
        result['partOf'] = self.partOf.map{ |x| x.as_json(*args) }
      end
      unless self.code.nil? 
        result['code'] = self.code.as_json(*args)
      end
      unless self.subject.nil? 
        result['subject'] = self.subject.as_json(*args)
      end
      unless self.context.nil? 
        result['context'] = self.context.as_json(*args)
      end
      unless self.occurrenceDateTime.nil?
        result['occurrenceDateTime'] = self.occurrenceDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.occurrenceDateTime) 
        result['_occurrenceDateTime'] = serialized unless serialized.nil?
      end          
      unless self.occurrencePeriod.nil?
        result['occurrencePeriod'] = self.occurrencePeriod.as_json(*args)                        
      end          
      unless self.occurrenceTiming.nil?
        result['occurrenceTiming'] = self.occurrenceTiming.as_json(*args)                        
      end          
      unless self.performer.nil?  || !self.performer.any? 
        result['performer'] = self.performer.map{ |x| x.as_json(*args) }
      end
      unless self.performingOrganization.nil? 
        result['performingOrganization'] = self.performingOrganization.as_json(*args)
      end
      unless self.requestingOrganization.nil? 
        result['requestingOrganization'] = self.requestingOrganization.as_json(*args)
      end
      unless self.costCenter.nil? 
        result['costCenter'] = self.costCenter.as_json(*args)
      end
      unless self.quantity.nil? 
        result['quantity'] = self.quantity.as_json(*args)
      end
      unless self.bodysite.nil?  || !self.bodysite.any? 
        result['bodysite'] = self.bodysite.map{ |x| x.as_json(*args) }
      end
      unless self.factorOverride.nil? 
        result['factorOverride'] = self.factorOverride.value
        serialized = Extension.serializePrimitiveExtension(self.factorOverride)            
        result['_factorOverride'] = serialized unless serialized.nil?
      end
      unless self.priceOverride.nil? 
        result['priceOverride'] = self.priceOverride.as_json(*args)
      end
      unless self.overrideReason.nil? 
        result['overrideReason'] = self.overrideReason.value
        serialized = Extension.serializePrimitiveExtension(self.overrideReason)            
        result['_overrideReason'] = serialized unless serialized.nil?
      end
      unless self.enterer.nil? 
        result['enterer'] = self.enterer.as_json(*args)
      end
      unless self.enteredDate.nil? 
        result['enteredDate'] = self.enteredDate.value
        serialized = Extension.serializePrimitiveExtension(self.enteredDate)            
        result['_enteredDate'] = serialized unless serialized.nil?
      end
      unless self.reason.nil?  || !self.reason.any? 
        result['reason'] = self.reason.map{ |x| x.as_json(*args) }
      end
      unless self.service.nil?  || !self.service.any? 
        result['service'] = self.service.map{ |x| x.as_json(*args) }
      end
      unless self.productReference.nil?
        result['productReference'] = self.productReference.as_json(*args)                        
      end          
      unless self.productCodeableConcept.nil?
        result['productCodeableConcept'] = self.productCodeableConcept.as_json(*args)                        
      end          
      unless self.account.nil?  || !self.account.any? 
        result['account'] = self.account.map{ |x| x.as_json(*args) }
      end
      unless self.note.nil?  || !self.note.any? 
        result['note'] = self.note.map{ |x| x.as_json(*args) }
      end
      unless self.supportingInformation.nil?  || !self.supportingInformation.any? 
        result['supportingInformation'] = self.supportingInformation.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ChargeItem.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['definitionUri'] = json_hash['definitionUri'].each_with_index.map do |var, i|
        extension_hash = json_hash['_definitionUri'] && json_hash['_definitionUri'][i]
        PrimitiveUri.transform_json(var, extension_hash)
      end unless json_hash['definitionUri'].nil?
      result['definitionCanonical'] = json_hash['definitionCanonical'].each_with_index.map do |var, i|
        extension_hash = json_hash['_definitionCanonical'] && json_hash['_definitionCanonical'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['definitionCanonical'].nil?
      result['status'] = ChargeItemStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['partOf'] = json_hash['partOf'].map { |var| Reference.transform_json(var) } unless json_hash['partOf'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?
      result['context'] = Reference.transform_json(json_hash['context']) unless json_hash['context'].nil?
      result['occurrenceDateTime'] = PrimitiveDateTime.transform_json(json_hash['occurrenceDateTime'], json_hash['_occurrenceDateTime']) unless json_hash['occurrenceDateTime'].nil?
      result['occurrencePeriod'] = Period.transform_json(json_hash['occurrencePeriod']) unless json_hash['occurrencePeriod'].nil?
      result['occurrenceTiming'] = Timing.transform_json(json_hash['occurrenceTiming']) unless json_hash['occurrenceTiming'].nil?
      result['performer'] = json_hash['performer'].map { |var| ChargeItemPerformer.transform_json(var) } unless json_hash['performer'].nil?
      result['performingOrganization'] = Reference.transform_json(json_hash['performingOrganization']) unless json_hash['performingOrganization'].nil?
      result['requestingOrganization'] = Reference.transform_json(json_hash['requestingOrganization']) unless json_hash['requestingOrganization'].nil?
      result['costCenter'] = Reference.transform_json(json_hash['costCenter']) unless json_hash['costCenter'].nil?
      result['quantity'] = Quantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?
      result['bodysite'] = json_hash['bodysite'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['bodysite'].nil?
      result['factorOverride'] = PrimitiveDecimal.transform_json(json_hash['factorOverride'], json_hash['_factorOverride']) unless json_hash['factorOverride'].nil?
      result['priceOverride'] = Money.transform_json(json_hash['priceOverride']) unless json_hash['priceOverride'].nil?
      result['overrideReason'] = PrimitiveString.transform_json(json_hash['overrideReason'], json_hash['_overrideReason']) unless json_hash['overrideReason'].nil?
      result['enterer'] = Reference.transform_json(json_hash['enterer']) unless json_hash['enterer'].nil?
      result['enteredDate'] = PrimitiveDateTime.transform_json(json_hash['enteredDate'], json_hash['_enteredDate']) unless json_hash['enteredDate'].nil?
      result['reason'] = json_hash['reason'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reason'].nil?
      result['service'] = json_hash['service'].map { |var| Reference.transform_json(var) } unless json_hash['service'].nil?
      result['productReference'] = Reference.transform_json(json_hash['productReference']) unless json_hash['productReference'].nil?
      result['productCodeableConcept'] = CodeableConcept.transform_json(json_hash['productCodeableConcept']) unless json_hash['productCodeableConcept'].nil?
      result['account'] = json_hash['account'].map { |var| Reference.transform_json(var) } unless json_hash['account'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['supportingInformation'] = json_hash['supportingInformation'].map { |var| Reference.transform_json(var) } unless json_hash['supportingInformation'].nil?

      result
    end
  end
end
