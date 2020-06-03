module FHIR
  class AccountCoverage < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'AccountCoverage'
    embeds_one :coverage, class_name: 'Reference'
    field :priority, type:  # primitive
    embeds_one :_priority, class_name: 'Extension'
  end
end
