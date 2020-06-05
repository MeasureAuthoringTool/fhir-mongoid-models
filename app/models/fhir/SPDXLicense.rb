module FHIR
  class SPDXLicense < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'SPDXLicense'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
