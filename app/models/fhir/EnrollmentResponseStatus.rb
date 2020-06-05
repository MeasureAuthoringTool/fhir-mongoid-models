module FHIR
  class EnrollmentResponseStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'EnrollmentResponseStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
