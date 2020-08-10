module FHIR
  # fhir/concept_map_group_element_target.rb
  class ConceptMapGroupElementTarget < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::PrimitiveCode'    
    embeds_one :display, class_name: 'FHIR::PrimitiveString'    
    embeds_one :equivalence, class_name: 'FHIR::ConceptMapEquivalence'    
    embeds_one :comment, class_name: 'FHIR::PrimitiveString'    
    embeds_many :dependsOn, class_name: 'FHIR::ConceptMapGroupElementTargetDependsOn'    
    embeds_many :product, class_name: 'FHIR::ConceptMapGroupElementTargetDependsOn'    
    
    def as_json(*args)
      result = super      
      unless self.code.nil? 
        result['code'] = self.code.value
        serialized = Extension.serializePrimitiveExtension(self.code)            
        result['_code'] = serialized unless serialized.nil?
      end
      unless self.display.nil? 
        result['display'] = self.display.value
        serialized = Extension.serializePrimitiveExtension(self.display)            
        result['_display'] = serialized unless serialized.nil?
      end
      unless self.equivalence.nil? 
        result['equivalence'] = self.equivalence.value
        serialized = Extension.serializePrimitiveExtension(self.equivalence)            
        result['_equivalence'] = serialized unless serialized.nil?
      end
      unless self.comment.nil? 
        result['comment'] = self.comment.value
        serialized = Extension.serializePrimitiveExtension(self.comment)            
        result['_comment'] = serialized unless serialized.nil?
      end
      unless self.dependsOn.nil?  || !self.dependsOn.any? 
        result['dependsOn'] = self.dependsOn.map{ |x| x.as_json(*args) }
      end
      unless self.product.nil?  || !self.product.any? 
        result['product'] = self.product.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ConceptMapGroupElementTarget.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = PrimitiveCode.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?
      result['display'] = PrimitiveString.transform_json(json_hash['display'], json_hash['_display']) unless json_hash['display'].nil?
      result['equivalence'] = ConceptMapEquivalence.transform_json(json_hash['equivalence'], json_hash['_equivalence']) unless json_hash['equivalence'].nil?
      result['comment'] = PrimitiveString.transform_json(json_hash['comment'], json_hash['_comment']) unless json_hash['comment'].nil?
      result['dependsOn'] = json_hash['dependsOn'].map { |var| ConceptMapGroupElementTargetDependsOn.transform_json(var) } unless json_hash['dependsOn'].nil?
      result['product'] = json_hash['product'].map { |var| ConceptMapGroupElementTargetDependsOn.transform_json(var) } unless json_hash['product'].nil?

      result
    end
  end
end
