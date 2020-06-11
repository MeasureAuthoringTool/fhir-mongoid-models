module FHIR
  class CodeableConcept < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'CodeableConcept'
    embeds_many :coding, class_name: 'Coding'
    field :text, type:  # primitive
    embeds_one :_text, class_name: 'Extension'
  end
end
