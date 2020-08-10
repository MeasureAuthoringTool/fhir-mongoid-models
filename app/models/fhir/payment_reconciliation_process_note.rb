module FHIR
  # fhir/payment_reconciliation_process_note.rb
  class PaymentReconciliationProcessNote < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::NoteType'    
    embeds_one :text, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
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

    def self.transform_json(json_hash, target = PaymentReconciliationProcessNote.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = NoteType.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['text'] = PrimitiveString.transform_json(json_hash['text'], json_hash['_text']) unless json_hash['text'].nil?

      result
    end
  end
end
