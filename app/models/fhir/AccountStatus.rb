module FHIR
  class AccountStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'AccountStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
