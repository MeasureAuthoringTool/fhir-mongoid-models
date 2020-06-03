module FHIR
  class ConsentProvisionType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ConsentProvisionType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
