module FHIR
  # fhir/claim_payee.rb
  class ClaimPayee < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'
    embeds_one :party, class_name: 'FHIR::Reference'

    def self.transform_json(json_hash, target = ClaimPayee.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['party'] = Reference.transform_json(json_hash['party']) unless json_hash['party'].nil?      

      result
    end
  end
end
