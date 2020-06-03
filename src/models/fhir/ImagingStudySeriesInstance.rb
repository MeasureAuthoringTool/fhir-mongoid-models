module FHIR
  class ImagingStudySeriesInstance < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ImagingStudySeriesInstance'
    field :uid, type:  # primitive
    embeds_one :_uid, class_name: 'Extension'
    embeds_one :sopClass, class_name: 'Coding'
    field :number, type:  # primitive
    embeds_one :_number, class_name: 'Extension'
    field :title, type:  # primitive
    embeds_one :_title, class_name: 'Extension'
  end
end
