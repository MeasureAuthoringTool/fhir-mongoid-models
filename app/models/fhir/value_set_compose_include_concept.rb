module FHIR
  # fhir/value_set_compose_include_concept.rb
  class ValueSetComposeIncludeConcept < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ValueSetComposeIncludeConcept'
    embeds_one :code, class_name: 'PrimitiveCode'
    embeds_one :display, class_name: 'PrimitiveString'
    embeds_many :designation, class_name: 'ValueSetComposeIncludeConceptDesignation'

    def self.transform_json(json_hash)
      result = ValueSetComposeIncludeConcept.new
      result['code'] = PrimitiveCode.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?      
      result['display'] = PrimitiveString.transform_json(json_hash['display'], json_hash['_display']) unless json_hash['display'].nil?      
      result['designation'] = json_hash['designation'].map { |var| ValueSetComposeIncludeConceptDesignation.transform_json(var) } unless json_hash['designation'].nil?

      result
    end
  end
end
