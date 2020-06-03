module FHIR
  class EnrollmentRequest < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'EnrollmentRequest'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'EnrollmentRequestStatus'
    field :created, type:  # primitive
    embeds_one :_created, class_name: 'Extension'
    embeds_one :insurer, class_name: 'Reference'
    embeds_one :provider, class_name: 'Reference'
    embeds_one :candidate, class_name: 'Reference'
    embeds_one :coverage, class_name: 'Reference'
  end
end
