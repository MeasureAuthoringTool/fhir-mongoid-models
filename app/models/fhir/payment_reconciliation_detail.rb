module FHIR
  # fhir/payment_reconciliation_detail.rb
  class PaymentReconciliationDetail < BackboneElement
    include Mongoid::Document
    embeds_one :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :predecessor, class_name: 'FHIR::Identifier'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :request, class_name: 'FHIR::Reference'    
    embeds_one :submitter, class_name: 'FHIR::Reference'    
    embeds_one :response, class_name: 'FHIR::Reference'    
    embeds_one :date, class_name: 'FHIR::PrimitiveDate'    
    embeds_one :responsible, class_name: 'FHIR::Reference'    
    embeds_one :payee, class_name: 'FHIR::Reference'    
    embeds_one :amount, class_name: 'FHIR::Money'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil? 
        result['identifier'] = self.identifier.as_json(*args)
      end
      unless self.predecessor.nil? 
        result['predecessor'] = self.predecessor.as_json(*args)
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.request.nil? 
        result['request'] = self.request.as_json(*args)
      end
      unless self.submitter.nil? 
        result['submitter'] = self.submitter.as_json(*args)
      end
      unless self.response.nil? 
        result['response'] = self.response.as_json(*args)
      end
      unless self.date.nil? 
        result['date'] = self.date.value
        serialized = Extension.serializePrimitiveExtension(self.date)            
        result['_date'] = serialized unless serialized.nil?
      end
      unless self.responsible.nil? 
        result['responsible'] = self.responsible.as_json(*args)
      end
      unless self.payee.nil? 
        result['payee'] = self.payee.as_json(*args)
      end
      unless self.amount.nil? 
        result['amount'] = self.amount.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = PaymentReconciliationDetail.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?
      result['predecessor'] = Identifier.transform_json(json_hash['predecessor']) unless json_hash['predecessor'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['request'] = Reference.transform_json(json_hash['request']) unless json_hash['request'].nil?
      result['submitter'] = Reference.transform_json(json_hash['submitter']) unless json_hash['submitter'].nil?
      result['response'] = Reference.transform_json(json_hash['response']) unless json_hash['response'].nil?
      result['date'] = PrimitiveDate.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?
      result['responsible'] = Reference.transform_json(json_hash['responsible']) unless json_hash['responsible'].nil?
      result['payee'] = Reference.transform_json(json_hash['payee']) unless json_hash['payee'].nil?
      result['amount'] = Money.transform_json(json_hash['amount']) unless json_hash['amount'].nil?

      result
    end
  end
end
