module FHIR
  # fhir/coverage_eligibility_request.rb
  class CoverageEligibilityRequest < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'CoverageEligibilityRequest'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'EligibilityRequestStatus'
    embeds_one :priority, class_name: 'CodeableConcept'
    embeds_many :purpose, class_name: 'EligibilityRequestPurpose'
    embeds_one :patient, class_name: 'Reference'
    embeds_one :servicedDate, class_name: 'PrimitiveDate'
    embeds_one :servicedPeriod, class_name: 'Period'
    embeds_one :created, class_name: 'PrimitiveDateTime'
    embeds_one :enterer, class_name: 'Reference'
    embeds_one :provider, class_name: 'Reference'
    embeds_one :insurer, class_name: 'Reference'
    embeds_one :facility, class_name: 'Reference'
    embeds_many :supportingInfo, class_name: 'CoverageEligibilityRequestSupportingInfo'
    embeds_many :insurance, class_name: 'CoverageEligibilityRequestInsurance'
    embeds_many :item, class_name: 'CoverageEligibilityRequestItem'

    def self.transform_json(json_hash, target=CoverageEligibilityRequest.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = EligibilityRequestStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['priority'] = CodeableConcept.transform_json(json_hash['priority']) unless json_hash['priority'].nil?      
      result['purpose'] = json_hash['purpose'].map { |var| EligibilityRequestPurpose.transform_json(var) } unless json_hash['purpose'].nil?
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?      
      result['servicedDate'] = PrimitiveDate.transform_json(json_hash['servicedDate'], json_hash['_servicedDate']) unless json_hash['servicedDate'].nil?      
      result['servicedPeriod'] = Period.transform_json(json_hash['servicedPeriod']) unless json_hash['servicedPeriod'].nil?      
      result['created'] = PrimitiveDateTime.transform_json(json_hash['created'], json_hash['_created']) unless json_hash['created'].nil?      
      result['enterer'] = Reference.transform_json(json_hash['enterer']) unless json_hash['enterer'].nil?      
      result['provider'] = Reference.transform_json(json_hash['provider']) unless json_hash['provider'].nil?      
      result['insurer'] = Reference.transform_json(json_hash['insurer']) unless json_hash['insurer'].nil?      
      result['facility'] = Reference.transform_json(json_hash['facility']) unless json_hash['facility'].nil?      
      result['supportingInfo'] = json_hash['supportingInfo'].map { |var| CoverageEligibilityRequestSupportingInfo.transform_json(var) } unless json_hash['supportingInfo'].nil?
      result['insurance'] = json_hash['insurance'].map { |var| CoverageEligibilityRequestInsurance.transform_json(var) } unless json_hash['insurance'].nil?
      result['item'] = json_hash['item'].map { |var| CoverageEligibilityRequestItem.transform_json(var) } unless json_hash['item'].nil?

      result
    end
  end
end
