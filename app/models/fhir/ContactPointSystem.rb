module FHIR
  class ContactPointSystem < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ContactPointSystem'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
