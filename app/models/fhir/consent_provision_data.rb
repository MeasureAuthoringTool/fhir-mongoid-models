module FHIR
  # fhir/consent_provision_data.rb
  class ConsentProvisionData < BackboneElement
    include Mongoid::Document
    embeds_one :meaning, class_name: 'FHIR::ConsentDataMeaning'
    embeds_one :reference, class_name: 'FHIR::Reference'

    def self.transform_json(json_hash, target = ConsentProvisionData.new)
      result = self.superclass.transform_json(json_hash, target)
      result['meaning'] = ConsentDataMeaning.transform_json(json_hash['meaning']) unless json_hash['meaning'].nil?      
      result['reference'] = Reference.transform_json(json_hash['reference']) unless json_hash['reference'].nil?      

      result
    end
  end
end
