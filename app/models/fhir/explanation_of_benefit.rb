module FHIR
  # fhir/explanation_of_benefit.rb
  class ExplanationOfBenefit < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'ExplanationOfBenefit'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'ExplanationOfBenefitStatus'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :subType, class_name: 'CodeableConcept'
    embeds_one :use, class_name: 'Use'
    embeds_one :patient, class_name: 'Reference'
    embeds_one :billablePeriod, class_name: 'Period'
    embeds_one :created, class_name: 'PrimitiveDateTime'
    embeds_one :enterer, class_name: 'Reference'
    embeds_one :insurer, class_name: 'Reference'
    embeds_one :provider, class_name: 'Reference'
    embeds_one :priority, class_name: 'CodeableConcept'
    embeds_one :fundsReserveRequested, class_name: 'CodeableConcept'
    embeds_one :fundsReserve, class_name: 'CodeableConcept'
    embeds_many :related, class_name: 'ExplanationOfBenefitRelated'
    embeds_one :prescription, class_name: 'Reference'
    embeds_one :originalPrescription, class_name: 'Reference'
    embeds_one :payee, class_name: 'ExplanationOfBenefitPayee'
    embeds_one :referral, class_name: 'Reference'
    embeds_one :facility, class_name: 'Reference'
    embeds_one :claim, class_name: 'Reference'
    embeds_one :claimResponse, class_name: 'Reference'
    embeds_one :outcome, class_name: 'RemittanceOutcome'
    embeds_one :disposition, class_name: 'PrimitiveString'
    embeds_many :preAuthRef, class_name: 'PrimitiveString'
    embeds_many :preAuthRefPeriod, class_name: 'Period'
    embeds_many :careTeam, class_name: 'ExplanationOfBenefitCareTeam'
    embeds_many :supportingInfo, class_name: 'ExplanationOfBenefitSupportingInfo'
    embeds_many :diagnosis, class_name: 'ExplanationOfBenefitDiagnosis'
    embeds_many :procedure, class_name: 'ExplanationOfBenefitProcedure'
    embeds_one :precedence, class_name: 'PrimitivePositiveInt'
    embeds_many :insurance, class_name: 'ExplanationOfBenefitInsurance'
    embeds_one :accident, class_name: 'ExplanationOfBenefitAccident'
    embeds_many :item, class_name: 'ExplanationOfBenefitItem'
    embeds_many :addItem, class_name: 'ExplanationOfBenefitAddItem'
    embeds_many :adjudication, class_name: 'ExplanationOfBenefitItemAdjudication'
    embeds_many :total, class_name: 'ExplanationOfBenefitTotal'
    embeds_one :payment, class_name: 'ExplanationOfBenefitPayment'
    embeds_one :formCode, class_name: 'CodeableConcept'
    embeds_one :form, class_name: 'Attachment'
    embeds_many :processNote, class_name: 'ExplanationOfBenefitProcessNote'
    embeds_one :benefitPeriod, class_name: 'Period'
    embeds_many :benefitBalance, class_name: 'ExplanationOfBenefitBenefitBalance'

    def self.transform_json(json_hash, target=ExplanationOfBenefit.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = ExplanationOfBenefitStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['subType'] = CodeableConcept.transform_json(json_hash['subType']) unless json_hash['subType'].nil?      
      result['use'] = Use.transform_json(json_hash['use']) unless json_hash['use'].nil?      
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
      result['outcome'] = RemittanceOutcome.transform_json(json_hash['outcome']) unless json_hash['outcome'].nil?      
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
