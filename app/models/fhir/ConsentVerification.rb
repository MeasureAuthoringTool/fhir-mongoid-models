module FHIR
  class ConsentVerification < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ConsentVerification'
    field :verified, type:  # primitive
    embeds_one :_verified, class_name: 'Extension'
    embeds_one :verifiedWith, class_name: 'Reference'
    field :verificationDate, type:  # primitive
    embeds_one :_verificationDate, class_name: 'Extension'
  end
end
