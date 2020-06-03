module FHIR
  class BiologicallyDerivedProduct < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'BiologicallyDerivedProduct'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :productCategory, class_name: 'BiologicallyDerivedProductCategory'
    embeds_one :productCode, class_name: 'CodeableConcept'
    embeds_one :status, class_name: 'BiologicallyDerivedProductStatus'
    embeds_many :request, class_name: 'Reference'
    field :quantity, type:  # primitive
    embeds_one :_quantity, class_name: 'Extension'
    embeds_many :parent, class_name: 'Reference'
    embeds_one :collection, class_name: 'BiologicallyDerivedProductCollection'
    embeds_many :processing, class_name: 'BiologicallyDerivedProductProcessing'
    embeds_one :manipulation, class_name: 'BiologicallyDerivedProductManipulation'
    embeds_many :storage, class_name: 'BiologicallyDerivedProductStorage'
  end
end
