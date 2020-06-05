module FHIR
  class ConsentDataMeaning < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ConsentDataMeaning'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
