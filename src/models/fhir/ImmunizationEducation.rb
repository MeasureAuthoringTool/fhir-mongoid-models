module FHIR
  class ImmunizationEducation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ImmunizationEducation'
    field :documentType, type:  # primitive
    embeds_one :_documentType, class_name: 'Extension'
    field :reference, type:  # primitive
    embeds_one :_reference, class_name: 'Extension'
    field :publicationDate, type:  # primitive
    embeds_one :_publicationDate, class_name: 'Extension'
    field :presentationDate, type:  # primitive
    embeds_one :_presentationDate, class_name: 'Extension'
  end
end
