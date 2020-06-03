module FHIR
  class Meta < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'Meta'
    field :versionId, type:  # primitive
    embeds_one :_versionId, class_name: 'Extension'
    field :lastUpdated, type:  # primitive
    embeds_one :_lastUpdated, class_name: 'Extension'
    field :source, type:  # primitive
    embeds_one :_source, class_name: 'Extension'
    field :profile, type: Array # primitive
    embeds_many :_profile, class_name: 'Extension'
    embeds_many :security, class_name: 'Coding'
    embeds_many :tag, class_name: 'Coding'
  end
end
