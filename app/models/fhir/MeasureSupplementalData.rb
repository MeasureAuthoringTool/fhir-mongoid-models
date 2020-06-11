module FHIR
  class MeasureSupplementalData < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MeasureSupplementalData'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_many :usage, class_name: 'CodeableConcept'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_one :criteria, class_name: 'Expression'
  end
end
