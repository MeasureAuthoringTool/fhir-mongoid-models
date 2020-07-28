module FHIR
  # fhir/operation_outcome.rb
  class OperationOutcome < DomainResource
    include Mongoid::Document
    embeds_many :issue, class_name: 'FHIR::OperationOutcomeIssue'    

    def self.transform_json(json_hash, target = OperationOutcome.new)
      result = self.superclass.transform_json(json_hash, target)
      result['issue'] = json_hash['issue'].map { |var| OperationOutcomeIssue.transform_json(var) } unless json_hash['issue'].nil?

      result
    end
  end
end
