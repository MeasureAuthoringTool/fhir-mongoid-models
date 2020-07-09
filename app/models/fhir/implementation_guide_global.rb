module FHIR
  # fhir/implementation_guide_global.rb
  class ImplementationGuideGlobal < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::ResourceType'
    embeds_one :profile, class_name: 'FHIR::PrimitiveCanonical'

    def self.transform_json(json_hash, target = ImplementationGuideGlobal.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = ResourceType.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['profile'] = PrimitiveCanonical.transform_json(json_hash['profile'], json_hash['_profile']) unless json_hash['profile'].nil?      

      result
    end
  end
end
