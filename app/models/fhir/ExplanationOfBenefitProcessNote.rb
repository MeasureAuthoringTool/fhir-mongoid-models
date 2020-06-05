module FHIR
  class ExplanationOfBenefitProcessNote < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ExplanationOfBenefitProcessNote'
    field :number, type:  # primitive
    embeds_one :_number, class_name: 'Extension'
    embeds_one :type, class_name: 'NoteType'
    field :text, type:  # primitive
    embeds_one :_text, class_name: 'Extension'
    embeds_one :language, class_name: 'CodeableConcept'
  end
end
