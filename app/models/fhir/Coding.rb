module FHIR
  class Coding < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'Coding'
    field :system, type:  # primitive
    embeds_one :_system, class_name: 'Extension'
    field :version, type:  # primitive
    embeds_one :_version, class_name: 'Extension'
    field :code, type:  # primitive
    embeds_one :_code, class_name: 'Extension'
    field :display, type:  # primitive
    embeds_one :_display, class_name: 'Extension'
    field :userSelected, type:  # primitive
    embeds_one :_userSelected, class_name: 'Extension'
  end
end
