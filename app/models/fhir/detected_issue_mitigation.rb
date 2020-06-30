module FHIR
  # fhir/detected_issue_mitigation.rb
  class DetectedIssueMitigation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'DetectedIssueMitigation'
    embeds_one :action, class_name: 'CodeableConcept'
    embeds_one :date, class_name: 'PrimitiveDateTime'
    embeds_one :author, class_name: 'Reference'

    def self.transform_json(json_hash, target=DetectedIssueMitigation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['action'] = CodeableConcept.transform_json(json_hash['action']) unless json_hash['action'].nil?      
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?      
      result['author'] = Reference.transform_json(json_hash['author']) unless json_hash['author'].nil?      

      result
    end
  end
end
