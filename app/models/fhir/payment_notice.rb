module FHIR
  # fhir/payment_notice.rb
  class PaymentNotice < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::PaymentNoticeStatus'    
    embeds_one :request, class_name: 'FHIR::Reference'    
    embeds_one :response, class_name: 'FHIR::Reference'    
    embeds_one :created, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :provider, class_name: 'FHIR::Reference'    
    embeds_one :payment, class_name: 'FHIR::Reference'    
    embeds_one :paymentDate, class_name: 'FHIR::PrimitiveDate'    
    embeds_one :payee, class_name: 'FHIR::Reference'    
    embeds_one :recipient, class_name: 'FHIR::Reference'    
    embeds_one :amount, class_name: 'FHIR::Money'    
    embeds_one :paymentStatus, class_name: 'FHIR::CodeableConcept'    
    
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
      unless self.request.nil? 
        result['request'] = self.request.as_json(*args)
      end
      unless self.response.nil? 
        result['response'] = self.response.as_json(*args)
      end
      unless self.created.nil? 
        result['created'] = self.created.value
        serialized = Extension.serializePrimitiveExtension(self.created)            
        result['_created'] = serialized unless serialized.nil?
      end
      unless self.provider.nil? 
        result['provider'] = self.provider.as_json(*args)
      end
      unless self.payment.nil? 
        result['payment'] = self.payment.as_json(*args)
      end
      unless self.paymentDate.nil? 
        result['paymentDate'] = self.paymentDate.value
        serialized = Extension.serializePrimitiveExtension(self.paymentDate)            
        result['_paymentDate'] = serialized unless serialized.nil?
      end
      unless self.payee.nil? 
        result['payee'] = self.payee.as_json(*args)
      end
      unless self.recipient.nil? 
        result['recipient'] = self.recipient.as_json(*args)
      end
      unless self.amount.nil? 
        result['amount'] = self.amount.as_json(*args)
      end
      unless self.paymentStatus.nil? 
        result['paymentStatus'] = self.paymentStatus.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = PaymentNotice.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = PaymentNoticeStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['request'] = Reference.transform_json(json_hash['request']) unless json_hash['request'].nil?
      result['response'] = Reference.transform_json(json_hash['response']) unless json_hash['response'].nil?
      result['created'] = PrimitiveDateTime.transform_json(json_hash['created'], json_hash['_created']) unless json_hash['created'].nil?
      result['provider'] = Reference.transform_json(json_hash['provider']) unless json_hash['provider'].nil?
      result['payment'] = Reference.transform_json(json_hash['payment']) unless json_hash['payment'].nil?
      result['paymentDate'] = PrimitiveDate.transform_json(json_hash['paymentDate'], json_hash['_paymentDate']) unless json_hash['paymentDate'].nil?
      result['payee'] = Reference.transform_json(json_hash['payee']) unless json_hash['payee'].nil?
      result['recipient'] = Reference.transform_json(json_hash['recipient']) unless json_hash['recipient'].nil?
      result['amount'] = Money.transform_json(json_hash['amount']) unless json_hash['amount'].nil?
      result['paymentStatus'] = CodeableConcept.transform_json(json_hash['paymentStatus']) unless json_hash['paymentStatus'].nil?

      result
    end
  end
end
