module FHIR
  class AllergyIntoleranceCategory < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'AllergyIntoleranceCategory'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
