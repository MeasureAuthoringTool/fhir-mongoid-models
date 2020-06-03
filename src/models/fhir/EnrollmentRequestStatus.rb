module FHIR
  class EnrollmentRequestStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'EnrollmentRequestStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
