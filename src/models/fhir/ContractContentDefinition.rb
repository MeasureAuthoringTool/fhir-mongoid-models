module FHIR
  class ContractContentDefinition < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ContractContentDefinition'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :subType, class_name: 'CodeableConcept'
    embeds_one :publisher, class_name: 'Reference'
    field :publicationDate, type:  # primitive
    embeds_one :_publicationDate, class_name: 'Extension'
    embeds_one :publicationStatus, class_name: 'ContractPublicationStatus'
    field :copyright, type:  # primitive
    embeds_one :_copyright, class_name: 'Extension'
  end
end
