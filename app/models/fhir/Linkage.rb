module FHIR
  class Linkage < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Linkage'
    field :active, type:  # primitive
    embeds_one :_active, class_name: 'Extension'
    embeds_one :author, class_name: 'Reference'
    embeds_many :item, class_name: 'LinkageItem'
  end
end
