module FHIR
  # fhir/observation_reference_range.rb
  class ObservationReferenceRange < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ObservationReferenceRange'
    embeds_one :low, class_name: 'SimpleQuantity'
    embeds_one :high, class_name: 'SimpleQuantity'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :appliesTo, class_name: 'CodeableConcept'
    embeds_one :age, class_name: 'Range'
    embeds_one :text, class_name: 'PrimitiveString'

    def self.transform_json(json_hash, target=ObservationReferenceRange.new)
      result = self.superclass.transform_json(json_hash, target)
      result['low'] = SimpleQuantity.transform_json(json_hash['low']) unless json_hash['low'].nil?      
      result['high'] = SimpleQuantity.transform_json(json_hash['high']) unless json_hash['high'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['appliesTo'] = json_hash['appliesTo'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['appliesTo'].nil?
      result['age'] = Range.transform_json(json_hash['age']) unless json_hash['age'].nil?      
      result['text'] = PrimitiveString.transform_json(json_hash['text'], json_hash['_text']) unless json_hash['text'].nil?      

      result
    end
  end
end
