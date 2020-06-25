module FHIR
  # fhir/invoice_participant.rb
  class InvoiceParticipant < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'InvoiceParticipant'
    embeds_one :role, class_name: 'CodeableConcept'
    embeds_one :actor, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = InvoiceParticipant.new
      result['role'] = CodeableConcept.transform_json(json_hash['role']) unless json_hash['role'].nil?      
      result['actor'] = Reference.transform_json(json_hash['actor']) unless json_hash['actor'].nil?      

      result
    end
  end
end
