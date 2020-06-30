module FHIR
  # fhir/concept_map_group_element_target.rb
  class ConceptMapGroupElementTarget < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ConceptMapGroupElementTarget'
    embeds_one :code, class_name: 'PrimitiveCode'
    embeds_one :display, class_name: 'PrimitiveString'
    embeds_one :equivalence, class_name: 'ConceptMapEquivalence'
    embeds_one :comment, class_name: 'PrimitiveString'
    embeds_many :dependsOn, class_name: 'ConceptMapGroupElementTargetDependsOn'
    embeds_many :product, class_name: 'ConceptMapGroupElementTargetDependsOn'

    def self.transform_json(json_hash, target=ConceptMapGroupElementTarget.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = PrimitiveCode.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?      
      result['display'] = PrimitiveString.transform_json(json_hash['display'], json_hash['_display']) unless json_hash['display'].nil?      
      result['equivalence'] = ConceptMapEquivalence.transform_json(json_hash['equivalence']) unless json_hash['equivalence'].nil?      
      result['comment'] = PrimitiveString.transform_json(json_hash['comment'], json_hash['_comment']) unless json_hash['comment'].nil?      
      result['dependsOn'] = json_hash['dependsOn'].map { |var| ConceptMapGroupElementTargetDependsOn.transform_json(var) } unless json_hash['dependsOn'].nil?
      result['product'] = json_hash['product'].map { |var| ConceptMapGroupElementTargetDependsOn.transform_json(var) } unless json_hash['product'].nil?

      result
    end
  end
end
