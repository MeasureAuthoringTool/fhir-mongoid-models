module FHIR
  class Resource
    include Mongoid::Document
    field :typeName, type: String, default: 'Resource'
    field :id, type: String # primitive
    embeds_one :_id, class_name: 'Extension'
    embeds_one :meta, class_name: 'Meta'
    field :implicitRules, type:  # primitive
    embeds_one :_implicitRules, class_name: 'Extension'
    field :language, type:  # primitive
    embeds_one :_language, class_name: 'Extension'
  end
end
