module FHIR
  class ContactPointUse < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ContactPointUse'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
