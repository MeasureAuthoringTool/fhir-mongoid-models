module FHIR
  class ResearchSubjectStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ResearchSubjectStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
