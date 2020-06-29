module FHIR
  # fhir/narrative.rb
  class Narrative < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'Narrative'
    embeds_one :status, class_name: 'NarrativeStatus'
    embeds_one :div, class_name: 'PrimitiveXhtml'

    def self.transform_json(json_hash, target=Narrative.new)
      result = self.superclass.transform_json(json_hash, target)
      result['status'] = NarrativeStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['div'] = PrimitiveXhtml.transform_json(json_hash['div'], json_hash['_div']) unless json_hash['div'].nil?      

      result
    end
  end
end
