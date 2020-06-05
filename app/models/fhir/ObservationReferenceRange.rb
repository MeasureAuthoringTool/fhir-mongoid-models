module FHIR
  class ObservationReferenceRange < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ObservationReferenceRange'
    embeds_one :low, class_name: 'SimpleQuantity'
    embeds_one :high, class_name: 'SimpleQuantity'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :appliesTo, class_name: 'CodeableConcept'
    embeds_one :age, class_name: 'Range'
    field :text, type:  # primitive
    embeds_one :_text, class_name: 'Extension'
  end
end
