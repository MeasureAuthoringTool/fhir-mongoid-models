module FHIR
  class CompositionAttester < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CompositionAttester'
    embeds_one :mode, class_name: 'CompositionAttestationMode'
    field :time, type:  # primitive
    embeds_one :_time, class_name: 'Extension'
    embeds_one :party, class_name: 'Reference'
  end
end
