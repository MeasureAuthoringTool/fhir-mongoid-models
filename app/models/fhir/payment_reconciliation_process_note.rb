module FHIR
  # fhir/payment_reconciliation_process_note.rb
  class PaymentReconciliationProcessNote < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::NoteType'
    embeds_one :text, class_name: 'FHIR::PrimitiveString'

    def self.transform_json(json_hash, target = PaymentReconciliationProcessNote.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = NoteType.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['text'] = PrimitiveString.transform_json(json_hash['text'], json_hash['_text']) unless json_hash['text'].nil?      

      result
    end
  end
end
