module FHIR
  class ContactPoint < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ContactPoint'
    embeds_one :system, class_name: 'ContactPointSystem'
    field :value, type:  # primitive
    embeds_one :_value, class_name: 'Extension'
    embeds_one :use, class_name: 'ContactPointUse'
    field :rank, type:  # primitive
    embeds_one :_rank, class_name: 'Extension'
    embeds_one :period, class_name: 'Period'
  end
end
