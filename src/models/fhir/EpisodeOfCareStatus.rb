module FHIR
  class EpisodeOfCareStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'EpisodeOfCareStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
