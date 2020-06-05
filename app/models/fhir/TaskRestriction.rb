module FHIR
  class TaskRestriction < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TaskRestriction'
    field :repetitions, type:  # primitive
    embeds_one :_repetitions, class_name: 'Extension'
    embeds_one :period, class_name: 'Period'
    embeds_many :recipient, class_name: 'Reference'
  end
end
