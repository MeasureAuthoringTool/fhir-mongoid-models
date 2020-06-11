module FHIR
  class RiskEvidenceSynthesisCertainty < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'RiskEvidenceSynthesisCertainty'
    embeds_many :rating, class_name: 'CodeableConcept'
    embeds_many :note, class_name: 'Annotation'
    embeds_many :certaintySubcomponent, class_name: 'RiskEvidenceSynthesisCertaintyCertaintySubcomponent'
  end
end
