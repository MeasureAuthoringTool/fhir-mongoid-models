module FHIR
  # fhir/claim_response.rb
  class ClaimResponse < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'ClaimResponseStatus'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :subType, class_name: 'CodeableConcept'
    embeds_one :use, class_name: 'Use'
    embeds_one :patient, class_name: 'Reference'
    embeds_one :created, class_name: 'PrimitiveDateTime'
    embeds_one :insurer, class_name: 'Reference'
    embeds_one :requestor, class_name: 'Reference'
    embeds_one :request, class_name: 'Reference'
    embeds_one :outcome, class_name: 'RemittanceOutcome'
    embeds_one :disposition, class_name: 'PrimitiveString'
    embeds_one :preAuthRef, class_name: 'PrimitiveString'
    embeds_one :preAuthPeriod, class_name: 'Period'
    embeds_one :payeeType, class_name: 'CodeableConcept'
    embeds_many :item, class_name: 'ClaimResponseItem'
    embeds_many :addItem, class_name: 'ClaimResponseAddItem'
    embeds_many :adjudication, class_name: 'ClaimResponseItemAdjudication'
    embeds_many :total, class_name: 'ClaimResponseTotal'
    embeds_one :payment, class_name: 'ClaimResponsePayment'
    embeds_one :fundsReserve, class_name: 'CodeableConcept'
    embeds_one :formCode, class_name: 'CodeableConcept'
    embeds_one :form, class_name: 'Attachment'
    embeds_many :processNote, class_name: 'ClaimResponseProcessNote'
    embeds_many :communicationRequest, class_name: 'Reference'
    embeds_many :insurance, class_name: 'ClaimResponseInsurance'
    embeds_many :error, class_name: 'ClaimResponseError'

    def self.transform_json(json_hash, target = ClaimResponse.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = ClaimResponseStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['subType'] = CodeableConcept.transform_json(json_hash['subType']) unless json_hash['subType'].nil?      
      result['use'] = Use.transform_json(json_hash['use']) unless json_hash['use'].nil?      
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?      
      result['created'] = PrimitiveDateTime.transform_json(json_hash['created'], json_hash['_created']) unless json_hash['created'].nil?      
      result['insurer'] = Reference.transform_json(json_hash['insurer']) unless json_hash['insurer'].nil?      
      result['requestor'] = Reference.transform_json(json_hash['requestor']) unless json_hash['requestor'].nil?      
      result['request'] = Reference.transform_json(json_hash['request']) unless json_hash['request'].nil?      
      result['outcome'] = RemittanceOutcome.transform_json(json_hash['outcome']) unless json_hash['outcome'].nil?      
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
