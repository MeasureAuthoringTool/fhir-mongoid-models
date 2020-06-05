module FHIR
  class CoverageStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'CoverageStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
