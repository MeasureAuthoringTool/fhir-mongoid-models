module FHIR
  class NoteType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'NoteType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
