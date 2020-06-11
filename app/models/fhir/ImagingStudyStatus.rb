module FHIR
  class ImagingStudyStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ImagingStudyStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
