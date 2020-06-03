module FHIR
  class ContractTermSecurityLabel < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ContractTermSecurityLabel'
    field :number, type: Array # primitive
    embeds_many :_number, class_name: 'Extension'
    embeds_one :classification, class_name: 'Coding'
    embeds_many :category, class_name: 'Coding'
    embeds_many :control, class_name: 'Coding'
  end
end
