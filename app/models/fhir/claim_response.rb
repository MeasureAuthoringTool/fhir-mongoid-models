module FHIR
  # fhir/claim_response.rb
  class ClaimResponse < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::ClaimResponseStatus'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :subType, class_name: 'FHIR::CodeableConcept'    
    embeds_one :use, class_name: 'FHIR::Use'    
    embeds_one :patient, class_name: 'FHIR::Reference'    
    embeds_one :created, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :insurer, class_name: 'FHIR::Reference'    
    embeds_one :requestor, class_name: 'FHIR::Reference'    
    embeds_one :request, class_name: 'FHIR::Reference'    
    embeds_one :outcome, class_name: 'FHIR::RemittanceOutcome'    
    embeds_one :disposition, class_name: 'FHIR::PrimitiveString'    
    embeds_one :preAuthRef, class_name: 'FHIR::PrimitiveString'    
    embeds_one :preAuthPeriod, class_name: 'FHIR::Period'    
    embeds_one :payeeType, class_name: 'FHIR::CodeableConcept'    
    embeds_many :item, class_name: 'FHIR::ClaimResponseItem'    
    embeds_many :addItem, class_name: 'FHIR::ClaimResponseAddItem'    
    embeds_many :adjudication, class_name: 'FHIR::ClaimResponseItemAdjudication'    
    embeds_many :total, class_name: 'FHIR::ClaimResponseTotal'    
    embeds_one :payment, class_name: 'FHIR::ClaimResponsePayment'    
    embeds_one :fundsReserve, class_name: 'FHIR::CodeableConcept'    
    embeds_one :formCode, class_name: 'FHIR::CodeableConcept'    
    embeds_one :form, class_name: 'FHIR::Attachment'    
    embeds_many :processNote, class_name: 'FHIR::ClaimResponseProcessNote'    
    embeds_many :communicationRequest, class_name: 'FHIR::Reference'    
    embeds_many :insurance, class_name: 'FHIR::ClaimResponseInsurance'    
    embeds_many :error, class_name: 'FHIR::ClaimResponseError'    
    
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
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.subType.nil? 
        result['subType'] = self.subType.as_json(*args)
      end
      unless self.use.nil? 
        result['use'] = self.use.value
        serialized = Extension.serializePrimitiveExtension(self.use)            
        result['_use'] = serialized unless serialized.nil?
      end
      unless self.patient.nil? 
        result['patient'] = self.patient.as_json(*args)
      end
      unless self.created.nil? 
        result['created'] = self.created.value
        serialized = Extension.serializePrimitiveExtension(self.created)            
        result['_created'] = serialized unless serialized.nil?
      end
      unless self.insurer.nil? 
        result['insurer'] = self.insurer.as_json(*args)
      end
      unless self.requestor.nil? 
        result['requestor'] = self.requestor.as_json(*args)
      end
      unless self.request.nil? 
        result['request'] = self.request.as_json(*args)
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
      unless self.preAuthRef.nil? 
        result['preAuthRef'] = self.preAuthRef.value
        serialized = Extension.serializePrimitiveExtension(self.preAuthRef)            
        result['_preAuthRef'] = serialized unless serialized.nil?
      end
      unless self.preAuthPeriod.nil? 
        result['preAuthPeriod'] = self.preAuthPeriod.as_json(*args)
      end
      unless self.payeeType.nil? 
        result['payeeType'] = self.payeeType.as_json(*args)
      end
      unless self.item.nil?  || !self.item.any? 
        result['item'] = self.item.map{ |x| x.as_json(*args) }
      end
      unless self.addItem.nil?  || !self.addItem.any? 
        result['addItem'] = self.addItem.map{ |x| x.as_json(*args) }
      end
      unless self.adjudication.nil?  || !self.adjudication.any? 
        result['adjudication'] = self.adjudication.map{ |x| x.as_json(*args) }
      end
      unless self.total.nil?  || !self.total.any? 
        result['total'] = self.total.map{ |x| x.as_json(*args) }
      end
      unless self.payment.nil? 
        result['payment'] = self.payment.as_json(*args)
      end
      unless self.fundsReserve.nil? 
        result['fundsReserve'] = self.fundsReserve.as_json(*args)
      end
      unless self.formCode.nil? 
        result['formCode'] = self.formCode.as_json(*args)
      end
      unless self.form.nil? 
        result['form'] = self.form.as_json(*args)
      end
      unless self.processNote.nil?  || !self.processNote.any? 
        result['processNote'] = self.processNote.map{ |x| x.as_json(*args) }
      end
      unless self.communicationRequest.nil?  || !self.communicationRequest.any? 
        result['communicationRequest'] = self.communicationRequest.map{ |x| x.as_json(*args) }
      end
      unless self.insurance.nil?  || !self.insurance.any? 
        result['insurance'] = self.insurance.map{ |x| x.as_json(*args) }
      end
      unless self.error.nil?  || !self.error.any? 
        result['error'] = self.error.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ClaimResponse.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = ClaimResponseStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['subType'] = CodeableConcept.transform_json(json_hash['subType']) unless json_hash['subType'].nil?
      result['use'] = Use.transform_json(json_hash['use'], json_hash['_use']) unless json_hash['use'].nil?
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?
      result['created'] = PrimitiveDateTime.transform_json(json_hash['created'], json_hash['_created']) unless json_hash['created'].nil?
      result['insurer'] = Reference.transform_json(json_hash['insurer']) unless json_hash['insurer'].nil?
      result['requestor'] = Reference.transform_json(json_hash['requestor']) unless json_hash['requestor'].nil?
      result['request'] = Reference.transform_json(json_hash['request']) unless json_hash['request'].nil?
      result['outcome'] = RemittanceOutcome.transform_json(json_hash['outcome'], json_hash['_outcome']) unless json_hash['outcome'].nil?
      result['disposition'] = PrimitiveString.transform_json(json_hash['disposition'], json_hash['_disposition']) unless json_hash['disposition'].nil?
      result['preAuthRef'] = PrimitiveString.transform_json(json_hash['preAuthRef'], json_hash['_preAuthRef']) unless json_hash['preAuthRef'].nil?
      result['preAuthPeriod'] = Period.transform_json(json_hash['preAuthPeriod']) unless json_hash['preAuthPeriod'].nil?
      result['payeeType'] = CodeableConcept.transform_json(json_hash['payeeType']) unless json_hash['payeeType'].nil?
      result['item'] = json_hash['item'].map { |var| ClaimResponseItem.transform_json(var) } unless json_hash['item'].nil?
      result['addItem'] = json_hash['addItem'].map { |var| ClaimResponseAddItem.transform_json(var) } unless json_hash['addItem'].nil?
      result['adjudication'] = json_hash['adjudication'].map { |var| ClaimResponseItemAdjudication.transform_json(var) } unless json_hash['adjudication'].nil?
      result['total'] = json_hash['total'].map { |var| ClaimResponseTotal.transform_json(var) } unless json_hash['total'].nil?
      result['payment'] = ClaimResponsePayment.transform_json(json_hash['payment']) unless json_hash['payment'].nil?
      result['fundsReserve'] = CodeableConcept.transform_json(json_hash['fundsReserve']) unless json_hash['fundsReserve'].nil?
      result['formCode'] = CodeableConcept.transform_json(json_hash['formCode']) unless json_hash['formCode'].nil?
      result['form'] = Attachment.transform_json(json_hash['form']) unless json_hash['form'].nil?
      result['processNote'] = json_hash['processNote'].map { |var| ClaimResponseProcessNote.transform_json(var) } unless json_hash['processNote'].nil?
      result['communicationRequest'] = json_hash['communicationRequest'].map { |var| Reference.transform_json(var) } unless json_hash['communicationRequest'].nil?
      result['insurance'] = json_hash['insurance'].map { |var| ClaimResponseInsurance.transform_json(var) } unless json_hash['insurance'].nil?
      result['error'] = json_hash['error'].map { |var| ClaimResponseError.transform_json(var) } unless json_hash['error'].nil?

      result
    end
  end
end
