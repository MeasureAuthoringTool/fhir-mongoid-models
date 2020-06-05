module FHIR
  class Group < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Group'
    embeds_many :identifier, class_name: 'Identifier'
    field :active, type:  # primitive
    embeds_one :_active, class_name: 'Extension'
    embeds_one :type, class_name: 'GroupType'
    field :actual, type:  # primitive
    embeds_one :_actual, class_name: 'Extension'
    embeds_one :code, class_name: 'CodeableConcept'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :quantity, type:  # primitive
    embeds_one :_quantity, class_name: 'Extension'
    embeds_one :managingEntity, class_name: 'Reference'
    embeds_many :characteristic, class_name: 'GroupCharacteristic'
    embeds_many :member, class_name: 'GroupMember'
  end
end
