module FHIR
  # fhir/account_guarantor.rb
  class AccountGuarantor < BackboneElement
    include Mongoid::Document
    embeds_one :party, class_name: 'FHIR::Reference'    
    embeds_one :onHold, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :period, class_name: 'FHIR::Period'    
    
    def as_json(*args)
      result = super      
      unless self.party.nil? 
        result['party'] = self.party.as_json(*args)
      end
      unless self.onHold.nil? 
        result['onHold'] = self.onHold.value
        serialized = Extension.serializePrimitiveExtension(self.onHold)            
        result['_onHold'] = serialized unless serialized.nil?
      end
      unless self.period.nil? 
        result['period'] = self.period.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = AccountGuarantor.new)
      result = self.superclass.transform_json(json_hash, target)
      result['party'] = Reference.transform_json(json_hash['party']) unless json_hash['party'].nil?
      result['onHold'] = PrimitiveBoolean.transform_json(json_hash['onHold'], json_hash['_onHold']) unless json_hash['onHold'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?

      result
    end
  end
end
