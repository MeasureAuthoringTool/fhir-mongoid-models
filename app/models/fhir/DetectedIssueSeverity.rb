module FHIR
  class DetectedIssueSeverity < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DetectedIssueSeverity'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
