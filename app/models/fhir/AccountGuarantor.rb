module FHIR
  class AccountGuarantor < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'AccountGuarantor'
    embeds_one :party, class_name: 'Reference'
    field :onHold, type:  # primitive
    embeds_one :_onHold, class_name: 'Extension'
    embeds_one :period, class_name: 'Period'
  end
end
