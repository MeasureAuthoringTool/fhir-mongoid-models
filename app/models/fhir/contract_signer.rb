module FHIR
  # fhir/contract_signer.rb
  class ContractSigner < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::Coding'    
    embeds_one :party, class_name: 'FHIR::Reference'    
    embeds_many :signature, class_name: 'FHIR::Signature'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.party.nil? 
        result['party'] = self.party.as_json(*args)
      end
      unless self.signature.nil?  || !self.signature.any? 
        result['signature'] = self.signature.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ContractSigner.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = Coding.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['party'] = Reference.transform_json(json_hash['party']) unless json_hash['party'].nil?
      result['signature'] = json_hash['signature'].map { |var| Signature.transform_json(var) } unless json_hash['signature'].nil?

      result
    end
  end
end
