module FHIR
  class PatientLink < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'PatientLink'
    embeds_one :other, class_name: 'Reference'
    embeds_one :type, class_name: 'LinkType'
  end
end
