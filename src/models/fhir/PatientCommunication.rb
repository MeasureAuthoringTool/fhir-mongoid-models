module FHIR
  class PatientCommunication < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'PatientCommunication'
    embeds_one :language, class_name: 'CodeableConcept'
    field :preferred, type:  # primitive
    embeds_one :_preferred, class_name: 'Extension'
  end
end
