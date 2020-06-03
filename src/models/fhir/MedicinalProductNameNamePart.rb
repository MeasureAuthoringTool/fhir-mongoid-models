module FHIR
  class MedicinalProductNameNamePart < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductNameNamePart'
    field :part, type:  # primitive
    embeds_one :_part, class_name: 'Extension'
    embeds_one :type, class_name: 'Coding'
  end
end
