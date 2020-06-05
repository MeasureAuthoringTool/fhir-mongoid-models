module FHIR
  class Parameters < Resource
    include Mongoid::Document
    field :typeName, type: String, default: 'Parameters'
    embeds_many :parameter, class_name: 'ParametersParameter'
  end
end
