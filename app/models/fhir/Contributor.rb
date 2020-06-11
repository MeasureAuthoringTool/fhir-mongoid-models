module FHIR
  class Contributor < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'Contributor'
    embeds_one :type, class_name: 'ContributorType'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    embeds_many :contact, class_name: 'ContactDetail'
  end
end
