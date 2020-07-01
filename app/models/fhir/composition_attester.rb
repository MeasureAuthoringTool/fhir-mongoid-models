module FHIR
  # fhir/composition_attester.rb
  class CompositionAttester < BackboneElement
    include Mongoid::Document
    embeds_one :mode, class_name: 'CompositionAttestationMode'
    embeds_one :time, class_name: 'PrimitiveDateTime'
    embeds_one :party, class_name: 'Reference'

    def self.transform_json(json_hash, target = CompositionAttester.new)
      result = self.superclass.transform_json(json_hash, target)
      result['mode'] = CompositionAttestationMode.transform_json(json_hash['mode']) unless json_hash['mode'].nil?      
      result['time'] = PrimitiveDateTime.transform_json(json_hash['time'], json_hash['_time']) unless json_hash['time'].nil?      
      result['party'] = Reference.transform_json(json_hash['party']) unless json_hash['party'].nil?      

      result
    end
  end
end
