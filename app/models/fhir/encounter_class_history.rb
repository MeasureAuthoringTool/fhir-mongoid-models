module FHIR
  # fhir/encounter_class_history.rb
  class EncounterClassHistory < BackboneElement
    include Mongoid::Document
    embeds_one :class, class_name: 'Coding'
    embeds_one :period, class_name: 'Period'

    def self.transform_json(json_hash, target = EncounterClassHistory.new)
      result = self.superclass.transform_json(json_hash, target)
      result['class'] = Coding.transform_json(json_hash['class']) unless json_hash['class'].nil?      
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?      

      result
    end
  end
end
