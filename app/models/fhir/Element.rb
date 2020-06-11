module FHIR
  class Element
    include Mongoid::Document
    field :typeName, type: String, default: 'Element'
    field :id, type: String # primitive
    embeds_one :_id, class_name: 'Extension'
    embeds_many :extension, class_name: 'Extension'
  end
end
