module FHIR
  class EpisodeOfCareStatusHistory < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'EpisodeOfCareStatusHistory'
    embeds_one :status, class_name: 'EpisodeOfCareStatus'
    embeds_one :period, class_name: 'Period'
  end
end
