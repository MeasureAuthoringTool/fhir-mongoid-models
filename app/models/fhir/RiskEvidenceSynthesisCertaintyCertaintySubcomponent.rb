module FHIR
  class RiskEvidenceSynthesisCertaintyCertaintySubcomponent < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'RiskEvidenceSynthesisCertaintyCertaintySubcomponent'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :rating, class_name: 'CodeableConcept'
    embeds_many :note, class_name: 'Annotation'
  end
end
