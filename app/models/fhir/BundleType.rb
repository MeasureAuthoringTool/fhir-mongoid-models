module FHIR
  class BundleType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'BundleType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
