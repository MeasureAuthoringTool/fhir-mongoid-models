module FHIR
  class RequestGroupActionRelatedAction < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'RequestGroupActionRelatedAction'
    field :actionId, type:  # primitive
    embeds_one :_actionId, class_name: 'Extension'
    embeds_one :relationship, class_name: 'ActionRelationshipType'
    embeds_one :offsetDuration, class_name: 'Duration'
    embeds_one :offsetRange, class_name: 'Range'
  end
end
