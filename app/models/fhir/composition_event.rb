module FHIR
  # fhir/composition_event.rb
  class CompositionEvent < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CompositionEvent'
    embeds_many :code, class_name: 'CodeableConcept'
    embeds_one :period, class_name: 'Period'
    embeds_many :detail, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = CompositionEvent.new
      result['code'] = json_hash['code'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['code'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?      
      result['detail'] = json_hash['detail'].map { |var| Reference.transform_json(var) } unless json_hash['detail'].nil?

      result
    end
  end
end
