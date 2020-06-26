module FHIR
  # fhir/account_coverage.rb
  class AccountCoverage < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'AccountCoverage'
    embeds_one :coverage, class_name: 'Reference'
    embeds_one :priority, class_name: 'PrimitivePositiveInt'

    def self.transform_json(json_hash)
      result = AccountCoverage.new
      result['coverage'] = Reference.transform_json(json_hash['coverage']) unless json_hash['coverage'].nil?      
      result['priority'] = PrimitivePositiveInt.transform_json(json_hash['priority'], json_hash['_priority']) unless json_hash['priority'].nil?      

      result
    end
  end
end
