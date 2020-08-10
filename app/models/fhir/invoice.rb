module FHIR
  # fhir/invoice.rb
  class Invoice < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::InvoiceStatus'    
    embeds_one :cancelledReason, class_name: 'FHIR::PrimitiveString'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :subject, class_name: 'FHIR::Reference'    
    embeds_one :recipient, class_name: 'FHIR::Reference'    
    embeds_one :date, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_many :participant, class_name: 'FHIR::InvoiceParticipant'    
    embeds_one :issuer, class_name: 'FHIR::Reference'    
    embeds_one :account, class_name: 'FHIR::Reference'    
    embeds_many :lineItem, class_name: 'FHIR::InvoiceLineItem'    
    embeds_many :totalPriceComponent, class_name: 'FHIR::InvoiceLineItemPriceComponent'    
    embeds_one :totalNet, class_name: 'FHIR::Money'    
    embeds_one :totalGross, class_name: 'FHIR::Money'    
    embeds_one :paymentTerms, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_many :note, class_name: 'FHIR::Annotation'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.cancelledReason.nil? 
        result['cancelledReason'] = self.cancelledReason.value
        serialized = Extension.serializePrimitiveExtension(self.cancelledReason)            
        result['_cancelledReason'] = serialized unless serialized.nil?
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.subject.nil? 
        result['subject'] = self.subject.as_json(*args)
      end
      unless self.recipient.nil? 
        result['recipient'] = self.recipient.as_json(*args)
      end
      unless self.date.nil? 
        result['date'] = self.date.value
        serialized = Extension.serializePrimitiveExtension(self.date)            
        result['_date'] = serialized unless serialized.nil?
      end
      unless self.participant.nil?  || !self.participant.any? 
        result['participant'] = self.participant.map{ |x| x.as_json(*args) }
      end
      unless self.issuer.nil? 
        result['issuer'] = self.issuer.as_json(*args)
      end
      unless self.account.nil? 
        result['account'] = self.account.as_json(*args)
      end
      unless self.lineItem.nil?  || !self.lineItem.any? 
        result['lineItem'] = self.lineItem.map{ |x| x.as_json(*args) }
      end
      unless self.totalPriceComponent.nil?  || !self.totalPriceComponent.any? 
        result['totalPriceComponent'] = self.totalPriceComponent.map{ |x| x.as_json(*args) }
      end
      unless self.totalNet.nil? 
        result['totalNet'] = self.totalNet.as_json(*args)
      end
      unless self.totalGross.nil? 
        result['totalGross'] = self.totalGross.as_json(*args)
      end
      unless self.paymentTerms.nil? 
        result['paymentTerms'] = self.paymentTerms.value
        serialized = Extension.serializePrimitiveExtension(self.paymentTerms)            
        result['_paymentTerms'] = serialized unless serialized.nil?
      end
      unless self.note.nil?  || !self.note.any? 
        result['note'] = self.note.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Invoice.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = InvoiceStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['cancelledReason'] = PrimitiveString.transform_json(json_hash['cancelledReason'], json_hash['_cancelledReason']) unless json_hash['cancelledReason'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?
      result['recipient'] = Reference.transform_json(json_hash['recipient']) unless json_hash['recipient'].nil?
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?
      result['participant'] = json_hash['participant'].map { |var| InvoiceParticipant.transform_json(var) } unless json_hash['participant'].nil?
      result['issuer'] = Reference.transform_json(json_hash['issuer']) unless json_hash['issuer'].nil?
      result['account'] = Reference.transform_json(json_hash['account']) unless json_hash['account'].nil?
      result['lineItem'] = json_hash['lineItem'].map { |var| InvoiceLineItem.transform_json(var) } unless json_hash['lineItem'].nil?
      result['totalPriceComponent'] = json_hash['totalPriceComponent'].map { |var| InvoiceLineItemPriceComponent.transform_json(var) } unless json_hash['totalPriceComponent'].nil?
      result['totalNet'] = Money.transform_json(json_hash['totalNet']) unless json_hash['totalNet'].nil?
      result['totalGross'] = Money.transform_json(json_hash['totalGross']) unless json_hash['totalGross'].nil?
      result['paymentTerms'] = PrimitiveMarkdown.transform_json(json_hash['paymentTerms'], json_hash['_paymentTerms']) unless json_hash['paymentTerms'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?

      result
    end
  end
end
