module FHIR
  # fhir/timing.rb
  class Timing < BackboneElement
    include Mongoid::Document
    embeds_many :event, class_name: 'PrimitiveDateTime'
    embeds_one :repeat, class_name: 'TimingRepeat'
    embeds_one :code, class_name: 'CodeableConcept'

    def self.transform_json(json_hash, target = Timing.new)
      result = self.superclass.transform_json(json_hash, target)
      result['event'] = json_hash['event'].each_with_index.map do |var, i|
        extension_hash = json_hash['_event'] && json_hash['_event'][i]
        PrimitiveDateTime.transform_json(var, extension_hash)
      end unless json_hash['event'].nil?
      result['repeat'] = TimingRepeat.transform_json(json_hash['repeat']) unless json_hash['repeat'].nil?      
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      

      result
    end
  end
end
