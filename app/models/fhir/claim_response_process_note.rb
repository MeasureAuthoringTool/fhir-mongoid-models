module FHIR
  # fhir/claim_response_process_note.rb
  class ClaimResponseProcessNote < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ClaimResponseProcessNote'
    embeds_one :number, class_name: 'PrimitivePositiveInt'
    embeds_one :type, class_name: 'NoteType'
    embeds_one :text, class_name: 'PrimitiveString'
    embeds_one :language, class_name: 'CodeableConcept'

    def self.transform_json(json_hash, target=ClaimResponseProcessNote.new)
      result = self.superclass.transform_json(json_hash, target)
      result['number'] = PrimitivePositiveInt.transform_json(json_hash['number'], json_hash['_number']) unless json_hash['number'].nil?      
      result['type'] = NoteType.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['text'] = PrimitiveString.transform_json(json_hash['text'], json_hash['_text']) unless json_hash['text'].nil?      
      result['language'] = CodeableConcept.transform_json(json_hash['language']) unless json_hash['language'].nil?      

      result
    end
  end
end
