module FHIR
  class PersonLink < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'PersonLink'
    embeds_one :target, class_name: 'Reference'
    embeds_one :assurance, class_name: 'IdentityAssuranceLevel'
  end
end
