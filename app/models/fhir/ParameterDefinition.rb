module FHIR
  class ParameterDefinition < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ParameterDefinition'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    embeds_one :use, class_name: 'ParameterUse'
    field :min, type:  # primitive
    embeds_one :_min, class_name: 'Extension'
    field :max, type:  # primitive
    embeds_one :_max, class_name: 'Extension'
    field :documentation, type:  # primitive
    embeds_one :_documentation, class_name: 'Extension'
    embeds_one :type, class_name: 'FHIRAllTypes'
    field :profile, type:  # primitive
    embeds_one :_profile, class_name: 'Extension'
  end
end
