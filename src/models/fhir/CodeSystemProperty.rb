module FHIR
  class CodeSystemProperty < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CodeSystemProperty'
    field :code, type:  # primitive
    embeds_one :_code, class_name: 'Extension'
    field :uri, type:  # primitive
    embeds_one :_uri, class_name: 'Extension'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_one :type, class_name: 'PropertyType'
  end
end
