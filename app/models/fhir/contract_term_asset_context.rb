module FHIR
  # fhir/contract_term_asset_context.rb
  class ContractTermAssetContext < BackboneElement
    include Mongoid::Document
    embeds_one :reference, class_name: 'FHIR::Reference'    
    embeds_many :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :text, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.reference.nil? 
        result['reference'] = self.reference.as_json(*args)
      end
      unless self.code.nil?  || !self.code.any? 
        result['code'] = self.code.map{ |x| x.as_json(*args) }
      end
      unless self.text.nil? 
        result['text'] = self.text.value
        serialized = Extension.serializePrimitiveExtension(self.text)            
        result['_text'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ContractTermAssetContext.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['reference'] = Reference.transform_json(json_hash['reference']) unless json_hash['reference'].nil?
      result['code'] = json_hash['code'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['code'].nil?
      result['text'] = PrimitiveString.transform_json(json_hash['text'], json_hash['_text']) unless json_hash['text'].nil?

      result
    end
  end
end
