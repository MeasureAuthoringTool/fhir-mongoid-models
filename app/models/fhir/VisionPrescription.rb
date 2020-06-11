module FHIR
  class VisionPrescription < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'VisionPrescription'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'VisionStatus'
    field :created, type:  # primitive
    embeds_one :_created, class_name: 'Extension'
    embeds_one :patient, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    field :dateWritten, type:  # primitive
    embeds_one :_dateWritten, class_name: 'Extension'
    embeds_one :prescriber, class_name: 'Reference'
    embeds_many :lensSpecification, class_name: 'VisionPrescriptionLensSpecification'
  end
end
