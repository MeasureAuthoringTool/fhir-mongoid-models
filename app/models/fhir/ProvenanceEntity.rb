module FHIR
  class ProvenanceEntity < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ProvenanceEntity'
    embeds_one :role, class_name: 'ProvenanceEntityRole'
    embeds_one :what, class_name: 'Reference'
    embeds_many :agent, class_name: 'ProvenanceAgent'
  end
end
