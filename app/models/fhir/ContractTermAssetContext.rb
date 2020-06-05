module FHIR
  class ContractTermAssetContext < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ContractTermAssetContext'
    embeds_one :reference, class_name: 'Reference'
    embeds_many :code, class_name: 'CodeableConcept'
    field :text, type:  # primitive
    embeds_one :_text, class_name: 'Extension'
  end
end
