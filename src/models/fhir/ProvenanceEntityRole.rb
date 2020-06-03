module FHIR
  class ProvenanceEntityRole < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ProvenanceEntityRole'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
