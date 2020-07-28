module FHIR
  # fhir/concept_map_group_element_target_depends_on.rb
  class ConceptMapGroupElementTargetDependsOn < BackboneElement
    include Mongoid::Document
    embeds_one :property, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :system, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_one :value, class_name: 'FHIR::PrimitiveString'    
    embeds_one :display, class_name: 'FHIR::PrimitiveString'    

    def self.transform_json(json_hash, target = ConceptMapGroupElementTargetDependsOn.new)
      result = self.superclass.transform_json(json_hash, target)
      result['property'] = PrimitiveUri.transform_json(json_hash['property'], json_hash['_property']) unless json_hash['property'].nil?
      result['system'] = PrimitiveCanonical.transform_json(json_hash['system'], json_hash['_system']) unless json_hash['system'].nil?
      result['value'] = PrimitiveString.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?
      result['display'] = PrimitiveString.transform_json(json_hash['display'], json_hash['_display']) unless json_hash['display'].nil?

      result
    end
  end
end
