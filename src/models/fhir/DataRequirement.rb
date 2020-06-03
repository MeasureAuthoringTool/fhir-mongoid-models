module FHIR
  class DataRequirement < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DataRequirement'
    embeds_one :type, class_name: 'FHIRAllTypes'
    field :profile, type: Array # primitive
    embeds_many :_profile, class_name: 'Extension'
    embeds_one :subjectCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :subjectReference, class_name: 'Reference'
    field :mustSupport, type: Array # primitive
    embeds_many :_mustSupport, class_name: 'Extension'
    embeds_many :codeFilter, class_name: 'DataRequirementCodeFilter'
    embeds_many :dateFilter, class_name: 'DataRequirementDateFilter'
    field :limit, type:  # primitive
    embeds_one :_limit, class_name: 'Extension'
    embeds_many :sort, class_name: 'DataRequirementSort'
  end
end
