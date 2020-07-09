module FHIR
  # fhir/element_definition_constraint.rb
  class ElementDefinitionConstraint < Element
    include Mongoid::Document
    embeds_one :key, class_name: 'FHIR::PrimitiveId'
    embeds_one :requirements, class_name: 'FHIR::PrimitiveString'
    embeds_one :severity, class_name: 'FHIR::ConstraintSeverity'
    embeds_one :human, class_name: 'FHIR::PrimitiveString'
    embeds_one :expression, class_name: 'FHIR::PrimitiveString'
    embeds_one :xpath, class_name: 'FHIR::PrimitiveString'
    embeds_one :source, class_name: 'FHIR::PrimitiveCanonical'

    def self.transform_json(json_hash, target = ElementDefinitionConstraint.new)
      result = self.superclass.transform_json(json_hash, target)
      result['key'] = PrimitiveId.transform_json(json_hash['key'], json_hash['_key']) unless json_hash['key'].nil?      
      result['requirements'] = PrimitiveString.transform_json(json_hash['requirements'], json_hash['_requirements']) unless json_hash['requirements'].nil?      
      result['severity'] = ConstraintSeverity.transform_json(json_hash['severity']) unless json_hash['severity'].nil?      
      result['human'] = PrimitiveString.transform_json(json_hash['human'], json_hash['_human']) unless json_hash['human'].nil?      
      result['expression'] = PrimitiveString.transform_json(json_hash['expression'], json_hash['_expression']) unless json_hash['expression'].nil?      
      result['xpath'] = PrimitiveString.transform_json(json_hash['xpath'], json_hash['_xpath']) unless json_hash['xpath'].nil?      
      result['source'] = PrimitiveCanonical.transform_json(json_hash['source'], json_hash['_source']) unless json_hash['source'].nil?      

      result
    end
  end
end
