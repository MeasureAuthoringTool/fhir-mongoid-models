module FHIR
  # fhir/healthcare_service_not_available.rb
  class HealthcareServiceNotAvailable < BackboneElement
    include Mongoid::Document
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_one :during, class_name: 'Period'

    def self.transform_json(json_hash, target = HealthcareServiceNotAvailable.new)
      result = self.superclass.transform_json(json_hash, target)
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['during'] = Period.transform_json(json_hash['during']) unless json_hash['during'].nil?      

      result
    end
  end
end
