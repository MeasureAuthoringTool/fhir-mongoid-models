module FHIR
  class TerminologyCapabilitiesCodeSystemVersionFilter < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TerminologyCapabilitiesCodeSystemVersionFilter'
    field :code, type:  # primitive
    embeds_one :_code, class_name: 'Extension'
    field :op, type: Array # primitive
    embeds_many :_op, class_name: 'Extension'
  end
end
