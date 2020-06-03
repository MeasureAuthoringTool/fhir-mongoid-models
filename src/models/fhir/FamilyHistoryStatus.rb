module FHIR
  class FamilyHistoryStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'FamilyHistoryStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
