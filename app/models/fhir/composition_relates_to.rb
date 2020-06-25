module FHIR
  # fhir/composition_relates_to.rb
  class CompositionRelatesTo < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CompositionRelatesTo'
    embeds_one :code, class_name: 'DocumentRelationshipType'
    embeds_one :targetIdentifier, class_name: 'Identifier'
    embeds_one :targetReference, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = CompositionRelatesTo.new
      result['code'] = DocumentRelationshipType.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['targetIdentifier'] = Identifier.transform_json(json_hash['targetIdentifier']) unless json_hash['targetIdentifier'].nil?      
      result['targetReference'] = Reference.transform_json(json_hash['targetReference']) unless json_hash['targetReference'].nil?      

      result
    end
  end
end
