module FHIR
  class GroupMember < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'GroupMember'
    embeds_one :entity, class_name: 'Reference'
    embeds_one :period, class_name: 'Period'
    field :inactive, type:  # primitive
    embeds_one :_inactive, class_name: 'Extension'
  end
end
