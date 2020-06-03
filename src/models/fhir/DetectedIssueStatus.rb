module FHIR
  class DetectedIssueStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DetectedIssueStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
