module FHIR
  class EnrollmentResponse < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'EnrollmentResponse'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'EnrollmentResponseStatus'
    embeds_one :request, class_name: 'Reference'
    embeds_one :outcome, class_name: 'RemittanceOutcome'
    field :disposition, type:  # primitive
    embeds_one :_disposition, class_name: 'Extension'
    field :created, type:  # primitive
    embeds_one :_created, class_name: 'Extension'
    embeds_one :organization, class_name: 'Reference'
    embeds_one :requestProvider, class_name: 'Reference'
  end
end
