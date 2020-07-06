module FHIR
  # fhir/codeable_concept.rb
  class CodeableConcept < Element
    include Mongoid::Document
    embeds_many :coding, class_name: 'Coding'
    embeds_one :text, class_name: 'PrimitiveString'

    def self.transform_json(json_hash, target = CodeableConcept.new)
      result = self.superclass.transform_json(json_hash, target)
      result['coding'] = json_hash['coding'].map { |var| Coding.transform_json(var) } unless json_hash['coding'].nil?
      result['text'] = PrimitiveString.transform_json(json_hash['text'], json_hash['_text']) unless json_hash['text'].nil?      

      result
    end
  end
end
