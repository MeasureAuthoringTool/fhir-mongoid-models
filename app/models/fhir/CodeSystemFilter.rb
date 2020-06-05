module FHIR
  class CodeSystemFilter < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CodeSystemFilter'
    field :code, type:  # primitive
    embeds_one :_code, class_name: 'Extension'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_many :operator, class_name: 'FilterOperator'
    field :value, type:  # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
