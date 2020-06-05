module FHIR
  class TerminologyCapabilitiesCodeSystemVersion < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TerminologyCapabilitiesCodeSystemVersion'
    field :code, type:  # primitive
    embeds_one :_code, class_name: 'Extension'
    field :isDefault, type:  # primitive
    embeds_one :_isDefault, class_name: 'Extension'
    field :compositional, type:  # primitive
    embeds_one :_compositional, class_name: 'Extension'
    field :language, type: Array # primitive
    embeds_many :_language, class_name: 'Extension'
    embeds_many :filter, class_name: 'TerminologyCapabilitiesCodeSystemVersionFilter'
    field :property, type: Array # primitive
    embeds_many :_property, class_name: 'Extension'
  end
end
