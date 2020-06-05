module FHIR
  class ContractSigner < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ContractSigner'
    embeds_one :type, class_name: 'Coding'
    embeds_one :party, class_name: 'Reference'
    embeds_many :signature, class_name: 'Signature'
  end
end
