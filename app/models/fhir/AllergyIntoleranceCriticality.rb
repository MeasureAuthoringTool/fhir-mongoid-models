module FHIR
  class AllergyIntoleranceCriticality < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'AllergyIntoleranceCriticality'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
