module FHIR
  # fhir/coverage_eligibility_response.rb
  class CoverageEligibilityResponse < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'
    embeds_one :status, class_name: 'FHIR::EligibilityResponseStatus'
    embeds_many :purpose, class_name: 'FHIR::EligibilityResponsePurpose'
    embeds_one :patient, class_name: 'FHIR::Reference'
    embeds_one :servicedDate, class_name: 'FHIR::PrimitiveDate'
    embeds_one :servicedPeriod, class_name: 'FHIR::Period'
    embeds_one :created, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :requestor, class_name: 'FHIR::Reference'
    embeds_one :request, class_name: 'FHIR::Reference'
    embeds_one :outcome, class_name: 'FHIR::RemittanceOutcome'
    embeds_one :disposition, class_name: 'FHIR::PrimitiveString'
    embeds_one :insurer, class_name: 'FHIR::Reference'
    embeds_many :insurance, class_name: 'FHIR::CoverageEligibilityResponseInsurance'
    embeds_one :preAuthRef, class_name: 'FHIR::PrimitiveString'
    embeds_one :form, class_name: 'FHIR::CodeableConcept'
    embeds_many :error, class_name: 'FHIR::CoverageEligibilityResponseError'

    def self.transform_json(json_hash, target = CoverageEligibilityResponse.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = EligibilityResponseStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['purpose'] = json_hash['purpose'].map { |var| EligibilityResponsePurpose.transform_json(var) } unless json_hash['purpose'].nil?
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?      
      result['servicedDate'] = PrimitiveDate.transform_json(json_hash['servicedDate'], json_hash['_servicedDate']) unless json_hash['servicedDate'].nil?      
      result['servicedPeriod'] = Period.transform_json(json_hash['servicedPeriod']) unless json_hash['servicedPeriod'].nil?      
      result['created'] = PrimitiveDateTime.transform_json(json_hash['created'], json_hash['_created']) unless json_hash['created'].nil?      
      result['requestor'] = Reference.transform_json(json_hash['requestor']) unless json_hash['requestor'].nil?      
      result['request'] = Reference.transform_json(json_hash['request']) unless json_hash['request'].nil?      
      result['outcome'] = RemittanceOutcome.transform_json(json_hash['outcome']) unless json_hash['outcome'].nil?      
      result['disposition'] = PrimitiveString.transform_json(json_hash['disposition'], json_hash['_disposition']) unless json_hash['disposition'].nil?      
      result['insurer'] = Reference.transform_json(json_hash['insurer']) unless json_hash['insurer'].nil?      
      result['insurance'] = json_hash['insurance'].map { |var| CoverageEligibilityResponseInsurance.transform_json(var) } unless json_hash['insurance'].nil?
      result['preAuthRef'] = PrimitiveString.transform_json(json_hash['preAuthRef'], json_hash['_preAuthRef']) unless json_hash['preAuthRef'].nil?      
      result['form'] = CodeableConcept.transform_json(json_hash['form']) unless json_hash['form'].nil?      
      result['error'] = json_hash['error'].map { |var| CoverageEligibilityResponseError.transform_json(var) } unless json_hash['error'].nil?

      result
    end
  end
end
