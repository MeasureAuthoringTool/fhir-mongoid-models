module FHIR
  # fhir/explanation_of_benefit.rb
  class ExplanationOfBenefit < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::ExplanationOfBenefitStatus'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :subType, class_name: 'FHIR::CodeableConcept'    
    embeds_one :use, class_name: 'FHIR::Use'    
    embeds_one :patient, class_name: 'FHIR::Reference'    
    embeds_one :billablePeriod, class_name: 'FHIR::Period'    
    embeds_one :created, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :enterer, class_name: 'FHIR::Reference'    
    embeds_one :insurer, class_name: 'FHIR::Reference'    
    embeds_one :provider, class_name: 'FHIR::Reference'    
    embeds_one :priority, class_name: 'FHIR::CodeableConcept'    
    embeds_one :fundsReserveRequested, class_name: 'FHIR::CodeableConcept'    
    embeds_one :fundsReserve, class_name: 'FHIR::CodeableConcept'    
    embeds_many :related, class_name: 'FHIR::ExplanationOfBenefitRelated'    
    embeds_one :prescription, class_name: 'FHIR::Reference'    
    embeds_one :originalPrescription, class_name: 'FHIR::Reference'    
    embeds_one :payee, class_name: 'FHIR::ExplanationOfBenefitPayee'    
    embeds_one :referral, class_name: 'FHIR::Reference'    
    embeds_one :facility, class_name: 'FHIR::Reference'    
    embeds_one :claim, class_name: 'FHIR::Reference'    
    embeds_one :claimResponse, class_name: 'FHIR::Reference'    
    embeds_one :outcome, class_name: 'FHIR::RemittanceOutcome'    
    embeds_one :disposition, class_name: 'FHIR::PrimitiveString'    
    embeds_many :preAuthRef, class_name: 'FHIR::PrimitiveString'    
    embeds_many :preAuthRefPeriod, class_name: 'FHIR::Period'    
    embeds_many :careTeam, class_name: 'FHIR::ExplanationOfBenefitCareTeam'    
    embeds_many :supportingInfo, class_name: 'FHIR::ExplanationOfBenefitSupportingInfo'    
    embeds_many :diagnosis, class_name: 'FHIR::ExplanationOfBenefitDiagnosis'    
    embeds_many :procedure, class_name: 'FHIR::ExplanationOfBenefitProcedure'    
    embeds_one :precedence, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_many :insurance, class_name: 'FHIR::ExplanationOfBenefitInsurance'    
    embeds_one :accident, class_name: 'FHIR::ExplanationOfBenefitAccident'    
    embeds_many :item, class_name: 'FHIR::ExplanationOfBenefitItem'    
    embeds_many :addItem, class_name: 'FHIR::ExplanationOfBenefitAddItem'    
    embeds_many :adjudication, class_name: 'FHIR::ExplanationOfBenefitItemAdjudication'    
    embeds_many :total, class_name: 'FHIR::ExplanationOfBenefitTotal'    
    embeds_one :payment, class_name: 'FHIR::ExplanationOfBenefitPayment'    
    embeds_one :formCode, class_name: 'FHIR::CodeableConcept'    
    embeds_one :form, class_name: 'FHIR::Attachment'    
    embeds_many :processNote, class_name: 'FHIR::ExplanationOfBenefitProcessNote'    
    embeds_one :benefitPeriod, class_name: 'FHIR::Period'    
    embeds_many :benefitBalance, class_name: 'FHIR::ExplanationOfBenefitBenefitBalance'    
    
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
      unless self.billablePeriod.nil? 
        result['billablePeriod'] = self.billablePeriod.as_json(*args)
      end
      unless self.created.nil? 
        result['created'] = self.created.value
        serialized = Extension.serializePrimitiveExtension(self.created)            
        result['_created'] = serialized unless serialized.nil?
      end
      unless self.enterer.nil? 
        result['enterer'] = self.enterer.as_json(*args)
      end
      unless self.insurer.nil? 
        result['insurer'] = self.insurer.as_json(*args)
      end
      unless self.provider.nil? 
        result['provider'] = self.provider.as_json(*args)
      end
      unless self.priority.nil? 
        result['priority'] = self.priority.as_json(*args)
      end
      unless self.fundsReserveRequested.nil? 
        result['fundsReserveRequested'] = self.fundsReserveRequested.as_json(*args)
      end
      unless self.fundsReserve.nil? 
        result['fundsReserve'] = self.fundsReserve.as_json(*args)
      end
      unless self.related.nil?  || !self.related.any? 
        result['related'] = self.related.map{ |x| x.as_json(*args) }
      end
      unless self.prescription.nil? 
        result['prescription'] = self.prescription.as_json(*args)
      end
      unless self.originalPrescription.nil? 
        result['originalPrescription'] = self.originalPrescription.as_json(*args)
      end
      unless self.payee.nil? 
        result['payee'] = self.payee.as_json(*args)
      end
      unless self.referral.nil? 
        result['referral'] = self.referral.as_json(*args)
      end
      unless self.facility.nil? 
        result['facility'] = self.facility.as_json(*args)
      end
      unless self.claim.nil? 
        result['claim'] = self.claim.as_json(*args)
      end
      unless self.claimResponse.nil? 
        result['claimResponse'] = self.claimResponse.as_json(*args)
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
      unless self.preAuthRef.nil?  || !self.preAuthRef.any? 
        result['preAuthRef'] = self.preAuthRef.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.preAuthRef)                              
        result['_preAuthRef'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.preAuthRefPeriod.nil?  || !self.preAuthRefPeriod.any? 
        result['preAuthRefPeriod'] = self.preAuthRefPeriod.map{ |x| x.as_json(*args) }
      end
      unless self.careTeam.nil?  || !self.careTeam.any? 
        result['careTeam'] = self.careTeam.map{ |x| x.as_json(*args) }
      end
      unless self.supportingInfo.nil?  || !self.supportingInfo.any? 
        result['supportingInfo'] = self.supportingInfo.map{ |x| x.as_json(*args) }
      end
      unless self.diagnosis.nil?  || !self.diagnosis.any? 
        result['diagnosis'] = self.diagnosis.map{ |x| x.as_json(*args) }
      end
      unless self.procedure.nil?  || !self.procedure.any? 
        result['procedure'] = self.procedure.map{ |x| x.as_json(*args) }
      end
      unless self.precedence.nil? 
        result['precedence'] = self.precedence.value
        serialized = Extension.serializePrimitiveExtension(self.precedence)            
        result['_precedence'] = serialized unless serialized.nil?
      end
      unless self.insurance.nil?  || !self.insurance.any? 
        result['insurance'] = self.insurance.map{ |x| x.as_json(*args) }
      end
      unless self.accident.nil? 
        result['accident'] = self.accident.as_json(*args)
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
      unless self.formCode.nil? 
        result['formCode'] = self.formCode.as_json(*args)
      end
      unless self.form.nil? 
        result['form'] = self.form.as_json(*args)
      end
      unless self.processNote.nil?  || !self.processNote.any? 
        result['processNote'] = self.processNote.map{ |x| x.as_json(*args) }
      end
      unless self.benefitPeriod.nil? 
        result['benefitPeriod'] = self.benefitPeriod.as_json(*args)
      end
      unless self.benefitBalance.nil?  || !self.benefitBalance.any? 
        result['benefitBalance'] = self.benefitBalance.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ExplanationOfBenefit.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = ExplanationOfBenefitStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['subType'] = CodeableConcept.transform_json(json_hash['subType']) unless json_hash['subType'].nil?
      result['use'] = Use.transform_json(json_hash['use'], json_hash['_use']) unless json_hash['use'].nil?
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?
      result['billablePeriod'] = Period.transform_json(json_hash['billablePeriod']) unless json_hash['billablePeriod'].nil?
      result['created'] = PrimitiveDateTime.transform_json(json_hash['created'], json_hash['_created']) unless json_hash['created'].nil?
      result['enterer'] = Reference.transform_json(json_hash['enterer']) unless json_hash['enterer'].nil?
      result['insurer'] = Reference.transform_json(json_hash['insurer']) unless json_hash['insurer'].nil?
      result['provider'] = Reference.transform_json(json_hash['provider']) unless json_hash['provider'].nil?
      result['priority'] = CodeableConcept.transform_json(json_hash['priority']) unless json_hash['priority'].nil?
      result['fundsReserveRequested'] = CodeableConcept.transform_json(json_hash['fundsReserveRequested']) unless json_hash['fundsReserveRequested'].nil?
      result['fundsReserve'] = CodeableConcept.transform_json(json_hash['fundsReserve']) unless json_hash['fundsReserve'].nil?
      result['related'] = json_hash['related'].map { |var| ExplanationOfBenefitRelated.transform_json(var) } unless json_hash['related'].nil?
      result['prescription'] = Reference.transform_json(json_hash['prescription']) unless json_hash['prescription'].nil?
      result['originalPrescription'] = Reference.transform_json(json_hash['originalPrescription']) unless json_hash['originalPrescription'].nil?
      result['payee'] = ExplanationOfBenefitPayee.transform_json(json_hash['payee']) unless json_hash['payee'].nil?
      result['referral'] = Reference.transform_json(json_hash['referral']) unless json_hash['referral'].nil?
      result['facility'] = Reference.transform_json(json_hash['facility']) unless json_hash['facility'].nil?
      result['claim'] = Reference.transform_json(json_hash['claim']) unless json_hash['claim'].nil?
      result['claimResponse'] = Reference.transform_json(json_hash['claimResponse']) unless json_hash['claimResponse'].nil?
      result['outcome'] = RemittanceOutcome.transform_json(json_hash['outcome'], json_hash['_outcome']) unless json_hash['outcome'].nil?
      result['disposition'] = PrimitiveString.transform_json(json_hash['disposition'], json_hash['_disposition']) unless json_hash['disposition'].nil?
      result['preAuthRef'] = json_hash['preAuthRef'].each_with_index.map do |var, i|
        extension_hash = json_hash['_preAuthRef'] && json_hash['_preAuthRef'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['preAuthRef'].nil?
      result['preAuthRefPeriod'] = json_hash['preAuthRefPeriod'].map { |var| Period.transform_json(var) } unless json_hash['preAuthRefPeriod'].nil?
      result['careTeam'] = json_hash['careTeam'].map { |var| ExplanationOfBenefitCareTeam.transform_json(var) } unless json_hash['careTeam'].nil?
      result['supportingInfo'] = json_hash['supportingInfo'].map { |var| ExplanationOfBenefitSupportingInfo.transform_json(var) } unless json_hash['supportingInfo'].nil?
      result['diagnosis'] = json_hash['diagnosis'].map { |var| ExplanationOfBenefitDiagnosis.transform_json(var) } unless json_hash['diagnosis'].nil?
      result['procedure'] = json_hash['procedure'].map { |var| ExplanationOfBenefitProcedure.transform_json(var) } unless json_hash['procedure'].nil?
      result['precedence'] = PrimitivePositiveInt.transform_json(json_hash['precedence'], json_hash['_precedence']) unless json_hash['precedence'].nil?
      result['insurance'] = json_hash['insurance'].map { |var| ExplanationOfBenefitInsurance.transform_json(var) } unless json_hash['insurance'].nil?
      result['accident'] = ExplanationOfBenefitAccident.transform_json(json_hash['accident']) unless json_hash['accident'].nil?
      result['item'] = json_hash['item'].map { |var| ExplanationOfBenefitItem.transform_json(var) } unless json_hash['item'].nil?
      result['addItem'] = json_hash['addItem'].map { |var| ExplanationOfBenefitAddItem.transform_json(var) } unless json_hash['addItem'].nil?
      result['adjudication'] = json_hash['adjudication'].map { |var| ExplanationOfBenefitItemAdjudication.transform_json(var) } unless json_hash['adjudication'].nil?
      result['total'] = json_hash['total'].map { |var| ExplanationOfBenefitTotal.transform_json(var) } unless json_hash['total'].nil?
      result['payment'] = ExplanationOfBenefitPayment.transform_json(json_hash['payment']) unless json_hash['payment'].nil?
      result['formCode'] = CodeableConcept.transform_json(json_hash['formCode']) unless json_hash['formCode'].nil?
      result['form'] = Attachment.transform_json(json_hash['form']) unless json_hash['form'].nil?
      result['processNote'] = json_hash['processNote'].map { |var| ExplanationOfBenefitProcessNote.transform_json(var) } unless json_hash['processNote'].nil?
      result['benefitPeriod'] = Period.transform_json(json_hash['benefitPeriod']) unless json_hash['benefitPeriod'].nil?
      result['benefitBalance'] = json_hash['benefitBalance'].map { |var| ExplanationOfBenefitBenefitBalance.transform_json(var) } unless json_hash['benefitBalance'].nil?

      result
    end
  end
end
