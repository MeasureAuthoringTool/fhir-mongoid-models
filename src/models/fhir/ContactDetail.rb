module FHIR
  class ContactDetail < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ContactDetail'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    embeds_many :telecom, class_name: 'ContactPoint'
  end
end
