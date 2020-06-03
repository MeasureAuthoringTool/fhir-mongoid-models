module FHIR
  class ObservationDefinitionQualifiedInterval < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ObservationDefinitionQualifiedInterval'
    embeds_one :category, class_name: 'ObservationRangeCategory'
    embeds_one :range, class_name: 'Range'
    embeds_one :context, class_name: 'CodeableConcept'
    embeds_many :appliesTo, class_name: 'CodeableConcept'
    embeds_one :gender, class_name: 'AdministrativeGender'
    embeds_one :age, class_name: 'Range'
    embeds_one :gestationalAge, class_name: 'Range'
    field :condition, type:  # primitive
    embeds_one :_condition, class_name: 'Extension'
  end
end
