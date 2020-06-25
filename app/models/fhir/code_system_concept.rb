module FHIR
  # fhir/code_system_concept.rb
  class CodeSystemConcept < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CodeSystemConcept'
    embeds_one :code, class_name: 'PrimitiveCode'
    embeds_one :display, class_name: 'PrimitiveString'
    embeds_one :definition, class_name: 'PrimitiveString'
    embeds_many :designation, class_name: 'CodeSystemConceptDesignation'
    embeds_many :property, class_name: 'CodeSystemConceptProperty'
    embeds_many :concept, class_name: 'CodeSystemConcept'

    def self.transform_json(json_hash)
      result = CodeSystemConcept.new
      result['code'] = PrimitiveCode.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?      
      result['display'] = PrimitiveString.transform_json(json_hash['display'], json_hash['_display']) unless json_hash['display'].nil?      
      result['definition'] = PrimitiveString.transform_json(json_hash['definition'], json_hash['_definition']) unless json_hash['definition'].nil?      
      result['designation'] = json_hash['designation'].map { |var| CodeSystemConceptDesignation.transform_json(var) } unless json_hash['designation'].nil?
      result['property'] = json_hash['property'].map { |var| CodeSystemConceptProperty.transform_json(var) } unless json_hash['property'].nil?
      result['concept'] = json_hash['concept'].map { |var| CodeSystemConcept.transform_json(var) } unless json_hash['concept'].nil?

      result
    end
  end
end
