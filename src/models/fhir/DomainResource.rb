module FHIR
  class DomainResource < Resource
    include Mongoid::Document
    field :typeName, type: String, default: 'DomainResource'
    embeds_one :text, class_name: 'Narrative'
    embeds_many :contained, class_name: 'Resource'
    embeds_many :extension, class_name: 'Extension'
    embeds_many :modifierExtension, class_name: 'Extension'
  end
end
