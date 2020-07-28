module FHIR
  # fhir/patient_link.rb
  class PatientLink < BackboneElement
    include Mongoid::Document
    embeds_one :other, class_name: 'FHIR::Reference'    
    embeds_one :type, class_name: 'FHIR::LinkType'    

    def self.transform_json(json_hash, target = PatientLink.new)
      result = self.superclass.transform_json(json_hash, target)
      result['other'] = Reference.transform_json(json_hash['other']) unless json_hash['other'].nil?
      result['type'] = LinkType.transform_json(json_hash['type']) unless json_hash['type'].nil?

      result
    end
  end
end
