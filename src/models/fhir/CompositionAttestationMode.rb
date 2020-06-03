module FHIR
  class CompositionAttestationMode < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'CompositionAttestationMode'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
