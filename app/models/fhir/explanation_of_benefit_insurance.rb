module FHIR
  # fhir/explanation_of_benefit_insurance.rb
  class ExplanationOfBenefitInsurance < BackboneElement
    include Mongoid::Document
    embeds_one :focal, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :coverage, class_name: 'FHIR::Reference'    
    embeds_many :preAuthRef, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.focal.nil? 
        result['focal'] = self.focal.value
        serialized = Extension.serializePrimitiveExtension(self.focal)            
        result['_focal'] = serialized unless serialized.nil?
      end
      unless self.coverage.nil? 
        result['coverage'] = self.coverage.as_json(*args)
      end
      unless self.preAuthRef.nil?  || !self.preAuthRef.any? 
        result['preAuthRef'] = self.preAuthRef.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.preAuthRef)                              
        result['_preAuthRef'] = serialized unless serialized.nil? || !serialized.any?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ExplanationOfBenefitInsurance.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['focal'] = PrimitiveBoolean.transform_json(json_hash['focal'], json_hash['_focal']) unless json_hash['focal'].nil?
      result['coverage'] = Reference.transform_json(json_hash['coverage']) unless json_hash['coverage'].nil?
      result['preAuthRef'] = json_hash['preAuthRef'].each_with_index.map do |var, i|
        extension_hash = json_hash['_preAuthRef'] && json_hash['_preAuthRef'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['preAuthRef'].nil?

      result
    end
  end
end
