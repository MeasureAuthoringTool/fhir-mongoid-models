module FHIR
  class OperationOutcome < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'OperationOutcome'
    embeds_many :issue, class_name: 'OperationOutcomeIssue'
  end
end
