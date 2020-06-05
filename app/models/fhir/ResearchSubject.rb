module FHIR
  class ResearchSubject < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'ResearchSubject'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'ResearchSubjectStatus'
    embeds_one :period, class_name: 'Period'
    embeds_one :study, class_name: 'Reference'
    embeds_one :individual, class_name: 'Reference'
    field :assignedArm, type:  # primitive
    embeds_one :_assignedArm, class_name: 'Extension'
    field :actualArm, type:  # primitive
    embeds_one :_actualArm, class_name: 'Extension'
    embeds_one :consent, class_name: 'Reference'
  end
end
