module FHIR
  # fhir/contract_term_offer_party.rb
  class ContractTermOfferParty < BackboneElement
    include Mongoid::Document
    embeds_many :reference, class_name: 'FHIR::Reference'    
    embeds_one :role, class_name: 'FHIR::CodeableConcept'    
    
    def as_json(*args)
      result = super      
      unless self.reference.nil?  || !self.reference.any? 
        result['reference'] = self.reference.map{ |x| x.as_json(*args) }
      end
      unless self.role.nil? 
        result['role'] = self.role.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ContractTermOfferParty.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['reference'] = json_hash['reference'].map { |var| Reference.transform_json(var) } unless json_hash['reference'].nil?
      result['role'] = CodeableConcept.transform_json(json_hash['role']) unless json_hash['role'].nil?

      result
    end
  end
end
