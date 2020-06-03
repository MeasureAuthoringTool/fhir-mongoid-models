module FHIR
  class ConsentProvisionActor < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ConsentProvisionActor'
    embeds_one :role, class_name: 'CodeableConcept'
    embeds_one :reference, class_name: 'Reference'
  end
end
