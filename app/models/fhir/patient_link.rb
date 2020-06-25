module FHIR
  # fhir/patient_link.rb
  class PatientLink < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'PatientLink'
    embeds_one :other, class_name: 'Reference'
    embeds_one :type, class_name: 'LinkType'

    def self.transform_json(json_hash)
      result = PatientLink.new
      result['other'] = Reference.transform_json(json_hash['other']) unless json_hash['other'].nil?      
      result['type'] = LinkType.transform_json(json_hash['type']) unless json_hash['type'].nil?      

      result
    end
  end
end
