module FHIR
  # fhir/account_coverage.rb
  class AccountCoverage < BackboneElement
    include Mongoid::Document
    embeds_one :coverage, class_name: 'FHIR::Reference'    
    embeds_one :priority, class_name: 'FHIR::PrimitivePositiveInt'    

    def self.transform_json(json_hash, target = AccountCoverage.new)
      result = self.superclass.transform_json(json_hash, target)
      result['coverage'] = Reference.transform_json(json_hash['coverage']) unless json_hash['coverage'].nil?
      result['priority'] = PrimitivePositiveInt.transform_json(json_hash['priority'], json_hash['_priority']) unless json_hash['priority'].nil?

      result
    end
  end
end
