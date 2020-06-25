module FHIR
  # fhir/payment_reconciliation_process_note.rb
  class PaymentReconciliationProcessNote < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'PaymentReconciliationProcessNote'
    embeds_one :type, class_name: 'NoteType'
    embeds_one :text, class_name: 'PrimitiveString'

    def self.transform_json(json_hash)
      result = PaymentReconciliationProcessNote.new
      result['type'] = NoteType.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['text'] = PrimitiveString.transform_json(json_hash['text'], json_hash['_text']) unless json_hash['text'].nil?      

      result
    end
  end
end
