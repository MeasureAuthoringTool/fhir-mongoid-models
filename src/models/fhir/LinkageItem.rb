module FHIR
  class LinkageItem < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'LinkageItem'
    embeds_one :type, class_name: 'LinkageType'
    embeds_one :resource, class_name: 'Reference'
  end
end
