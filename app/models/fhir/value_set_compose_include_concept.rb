module FHIR
  # fhir/value_set_compose_include_concept.rb
  class ValueSetComposeIncludeConcept < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::PrimitiveCode'    
    embeds_one :display, class_name: 'FHIR::PrimitiveString'    
    embeds_many :designation, class_name: 'FHIR::ValueSetComposeIncludeConceptDesignation'    

    def self.transform_json(json_hash, target = ValueSetComposeIncludeConcept.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = PrimitiveCode.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?
      result['display'] = PrimitiveString.transform_json(json_hash['display'], json_hash['_display']) unless json_hash['display'].nil?
      result['designation'] = json_hash['designation'].map { |var| ValueSetComposeIncludeConceptDesignation.transform_json(var) } unless json_hash['designation'].nil?

      result
    end
  end
end
