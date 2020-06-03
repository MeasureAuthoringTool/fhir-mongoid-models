module FHIR
  class ConsentProvisionData < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ConsentProvisionData'
    embeds_one :meaning, class_name: 'ConsentDataMeaning'
    embeds_one :reference, class_name: 'Reference'
  end
end
