module FHIR
  # fhir/payment_reconciliation.rb
  class PaymentReconciliation < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::PaymentReconciliationStatus'    
    embeds_one :period, class_name: 'FHIR::Period'    
    embeds_one :created, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :paymentIssuer, class_name: 'FHIR::Reference'    
    embeds_one :request, class_name: 'FHIR::Reference'    
    embeds_one :requestor, class_name: 'FHIR::Reference'    
    embeds_one :outcome, class_name: 'FHIR::RemittanceOutcome'    
    embeds_one :disposition, class_name: 'FHIR::PrimitiveString'    
    embeds_one :paymentDate, class_name: 'FHIR::PrimitiveDate'    
    embeds_one :paymentAmount, class_name: 'FHIR::Money'    
    embeds_one :paymentIdentifier, class_name: 'FHIR::Identifier'    
    embeds_many :detail, class_name: 'FHIR::PaymentReconciliationDetail'    
    embeds_one :formCode, class_name: 'FHIR::CodeableConcept'    
    embeds_many :processNote, class_name: 'FHIR::PaymentReconciliationProcessNote'    
    
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
      unless self.period.nil? 
        result['period'] = self.period.as_json(*args)
      end
      unless self.created.nil? 
        result['created'] = self.created.value
        serialized = Extension.serializePrimitiveExtension(self.created)            
        result['_created'] = serialized unless serialized.nil?
      end
      unless self.paymentIssuer.nil? 
        result['paymentIssuer'] = self.paymentIssuer.as_json(*args)
      end
      unless self.request.nil? 
        result['request'] = self.request.as_json(*args)
      end
      unless self.requestor.nil? 
        result['requestor'] = self.requestor.as_json(*args)
      end
      unless self.outcome.nil? 
        result['outcome'] = self.outcome.value
        serialized = Extension.serializePrimitiveExtension(self.outcome)            
        result['_outcome'] = serialized unless serialized.nil?
      end
      unless self.disposition.nil? 
        result['disposition'] = self.disposition.value
        serialized = Extension.serializePrimitiveExtension(self.disposition)            
        result['_disposition'] = serialized unless serialized.nil?
      end
      unless self.paymentDate.nil? 
        result['paymentDate'] = self.paymentDate.value
        serialized = Extension.serializePrimitiveExtension(self.paymentDate)            
        result['_paymentDate'] = serialized unless serialized.nil?
      end
      unless self.paymentAmount.nil? 
        result['paymentAmount'] = self.paymentAmount.as_json(*args)
      end
      unless self.paymentIdentifier.nil? 
        result['paymentIdentifier'] = self.paymentIdentifier.as_json(*args)
      end
      unless self.detail.nil?  || !self.detail.any? 
        result['detail'] = self.detail.map{ |x| x.as_json(*args) }
      end
      unless self.formCode.nil? 
        result['formCode'] = self.formCode.as_json(*args)
      end
      unless self.processNote.nil?  || !self.processNote.any? 
        result['processNote'] = self.processNote.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = PaymentReconciliation.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = PaymentReconciliationStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?
      result['created'] = PrimitiveDateTime.transform_json(json_hash['created'], json_hash['_created']) unless json_hash['created'].nil?
      result['paymentIssuer'] = Reference.transform_json(json_hash['paymentIssuer']) unless json_hash['paymentIssuer'].nil?
      result['request'] = Reference.transform_json(json_hash['request']) unless json_hash['request'].nil?
      result['requestor'] = Reference.transform_json(json_hash['requestor']) unless json_hash['requestor'].nil?
      result['outcome'] = RemittanceOutcome.transform_json(json_hash['outcome'], json_hash['_outcome']) unless json_hash['outcome'].nil?
      result['disposition'] = PrimitiveString.transform_json(json_hash['disposition'], json_hash['_disposition']) unless json_hash['disposition'].nil?
      result['paymentDate'] = PrimitiveDate.transform_json(json_hash['paymentDate'], json_hash['_paymentDate']) unless json_hash['paymentDate'].nil?
      result['paymentAmount'] = Money.transform_json(json_hash['paymentAmount']) unless json_hash['paymentAmount'].nil?
      result['paymentIdentifier'] = Identifier.transform_json(json_hash['paymentIdentifier']) unless json_hash['paymentIdentifier'].nil?
      result['detail'] = json_hash['detail'].map { |var| PaymentReconciliationDetail.transform_json(var) } unless json_hash['detail'].nil?
      result['formCode'] = CodeableConcept.transform_json(json_hash['formCode']) unless json_hash['formCode'].nil?
      result['processNote'] = json_hash['processNote'].map { |var| PaymentReconciliationProcessNote.transform_json(var) } unless json_hash['processNote'].nil?

      result
    end
  end
end
