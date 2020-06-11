module FHIR
  class HumanName < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'HumanName'
    embeds_one :use, class_name: 'NameUse'
    field :text, type:  # primitive
    embeds_one :_text, class_name: 'Extension'
    field :family, type:  # primitive
    embeds_one :_family, class_name: 'Extension'
    field :given, type: Array # primitive
    embeds_many :_given, class_name: 'Extension'
    field :prefix, type: Array # primitive
    embeds_many :_prefix, class_name: 'Extension'
    field :suffix, type: Array # primitive
    embeds_many :_suffix, class_name: 'Extension'
    embeds_one :period, class_name: 'Period'
  end
end
