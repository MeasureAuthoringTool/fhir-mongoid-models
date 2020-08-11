module FHIR
  # fhir/claim_insurance.rb
  class ClaimInsurance < BackboneElement
    include Mongoid::Document
    embeds_one :sequence, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_one :focal, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :coverage, class_name: 'FHIR::Reference'    
    embeds_one :businessArrangement, class_name: 'FHIR::PrimitiveString'    
    embeds_many :preAuthRef, class_name: 'FHIR::PrimitiveString'    
    embeds_one :claimResponse, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.sequence.nil? 
        result['sequence'] = self.sequence.value
        serialized = Extension.serializePrimitiveExtension(self.sequence)            
        result['_sequence'] = serialized unless serialized.nil?
      end
      unless self.focal.nil? 
        result['focal'] = self.focal.value
        serialized = Extension.serializePrimitiveExtension(self.focal)            
        result['_focal'] = serialized unless serialized.nil?
      end
      unless self.identifier.nil? 
        result['identifier'] = self.identifier.as_json(*args)
      end
      unless self.coverage.nil? 
        result['coverage'] = self.coverage.as_json(*args)
      end
      unless self.businessArrangement.nil? 
        result['businessArrangement'] = self.businessArrangement.value
        serialized = Extension.serializePrimitiveExtension(self.businessArrangement)            
        result['_businessArrangement'] = serialized unless serialized.nil?
      end
      unless self.preAuthRef.nil?  || !self.preAuthRef.any? 
        result['preAuthRef'] = self.preAuthRef.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.preAuthRef)                              
        result['_preAuthRef'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.claimResponse.nil? 
        result['claimResponse'] = self.claimResponse.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ClaimInsurance.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['sequence'] = PrimitivePositiveInt.transform_json(json_hash['sequence'], json_hash['_sequence']) unless json_hash['sequence'].nil?
      result['focal'] = PrimitiveBoolean.transform_json(json_hash['focal'], json_hash['_focal']) unless json_hash['focal'].nil?
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?
      result['coverage'] = Reference.transform_json(json_hash['coverage']) unless json_hash['coverage'].nil?
      result['businessArrangement'] = PrimitiveString.transform_json(json_hash['businessArrangement'], json_hash['_businessArrangement']) unless json_hash['businessArrangement'].nil?
      result['preAuthRef'] = json_hash['preAuthRef'].each_with_index.map do |var, i|
        extension_hash = json_hash['_preAuthRef'] && json_hash['_preAuthRef'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['preAuthRef'].nil?
      result['claimResponse'] = Reference.transform_json(json_hash['claimResponse']) unless json_hash['claimResponse'].nil?

      result
    end
  end
end
