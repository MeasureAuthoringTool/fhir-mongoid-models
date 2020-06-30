module FHIR
  # fhir/claim.rb
  class Claim < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Claim'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'ClaimStatus'
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
    embeds_one :fundsReserve, class_name: 'CodeableConcept'
    embeds_many :related, class_name: 'ClaimRelated'
    embeds_one :prescription, class_name: 'Reference'
    embeds_one :originalPrescription, class_name: 'Reference'
    embeds_one :payee, class_name: 'ClaimPayee'
    embeds_one :referral, class_name: 'Reference'
    embeds_one :facility, class_name: 'Reference'
    embeds_many :careTeam, class_name: 'ClaimCareTeam'
    embeds_many :supportingInfo, class_name: 'ClaimSupportingInfo'
    embeds_many :diagnosis, class_name: 'ClaimDiagnosis'
    embeds_many :procedure, class_name: 'ClaimProcedure'
    embeds_many :insurance, class_name: 'ClaimInsurance'
    embeds_one :accident, class_name: 'ClaimAccident'
    embeds_many :item, class_name: 'ClaimItem'
    embeds_one :total, class_name: 'Money'

    def self.transform_json(json_hash, target=Claim.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = ClaimStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
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
      result['fundsReserve'] = CodeableConcept.transform_json(json_hash['fundsReserve']) unless json_hash['fundsReserve'].nil?      
      result['related'] = json_hash['related'].map { |var| ClaimRelated.transform_json(var) } unless json_hash['related'].nil?
      result['prescription'] = Reference.transform_json(json_hash['prescription']) unless json_hash['prescription'].nil?      
      result['originalPrescription'] = Reference.transform_json(json_hash['originalPrescription']) unless json_hash['originalPrescription'].nil?      
      result['payee'] = ClaimPayee.transform_json(json_hash['payee']) unless json_hash['payee'].nil?      
      result['referral'] = Reference.transform_json(json_hash['referral']) unless json_hash['referral'].nil?      
      result['facility'] = Reference.transform_json(json_hash['facility']) unless json_hash['facility'].nil?      
      result['careTeam'] = json_hash['careTeam'].map { |var| ClaimCareTeam.transform_json(var) } unless json_hash['careTeam'].nil?
      result['supportingInfo'] = json_hash['supportingInfo'].map { |var| ClaimSupportingInfo.transform_json(var) } unless json_hash['supportingInfo'].nil?
      result['diagnosis'] = json_hash['diagnosis'].map { |var| ClaimDiagnosis.transform_json(var) } unless json_hash['diagnosis'].nil?
      result['procedure'] = json_hash['procedure'].map { |var| ClaimProcedure.transform_json(var) } unless json_hash['procedure'].nil?
      result['insurance'] = json_hash['insurance'].map { |var| ClaimInsurance.transform_json(var) } unless json_hash['insurance'].nil?
      result['accident'] = ClaimAccident.transform_json(json_hash['accident']) unless json_hash['accident'].nil?      
      result['item'] = json_hash['item'].map { |var| ClaimItem.transform_json(var) } unless json_hash['item'].nil?
      result['total'] = Money.transform_json(json_hash['total']) unless json_hash['total'].nil?      

      result
    end
  end
end
