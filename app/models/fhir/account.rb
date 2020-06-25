module FHIR
  # fhir/account.rb
  class Account < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Account'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'AccountStatus'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_many :subject, class_name: 'Reference'
    embeds_one :servicePeriod, class_name: 'Period'
    embeds_many :coverage, class_name: 'AccountCoverage'
    embeds_one :owner, class_name: 'Reference'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_many :guarantor, class_name: 'AccountGuarantor'
    embeds_one :partOf, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = Account.new
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = AccountStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['subject'] = json_hash['subject'].map { |var| Reference.transform_json(var) } unless json_hash['subject'].nil?
      result['servicePeriod'] = Period.transform_json(json_hash['servicePeriod']) unless json_hash['servicePeriod'].nil?      
      result['coverage'] = json_hash['coverage'].map { |var| AccountCoverage.transform_json(var) } unless json_hash['coverage'].nil?
      result['owner'] = Reference.transform_json(json_hash['owner']) unless json_hash['owner'].nil?      
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['guarantor'] = json_hash['guarantor'].map { |var| AccountGuarantor.transform_json(var) } unless json_hash['guarantor'].nil?
      result['partOf'] = Reference.transform_json(json_hash['partOf']) unless json_hash['partOf'].nil?      

      result
    end
  end
end
