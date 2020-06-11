module FHIR
  class PractitionerQualification < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'PractitionerQualification'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :period, class_name: 'Period'
    embeds_one :issuer, class_name: 'Reference'
  end
end
