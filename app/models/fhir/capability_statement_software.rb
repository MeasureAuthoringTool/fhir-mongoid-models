module FHIR
  # fhir/capability_statement_software.rb
  class CapabilityStatementSoftware < BackboneElement
    include Mongoid::Document
    embeds_one :name, class_name: 'FHIR::PrimitiveString'
    embeds_one :version, class_name: 'FHIR::PrimitiveString'
    embeds_one :releaseDate, class_name: 'FHIR::PrimitiveDateTime'

    def self.transform_json(json_hash, target = CapabilityStatementSoftware.new)
      result = self.superclass.transform_json(json_hash, target)
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?      
      result['releaseDate'] = PrimitiveDateTime.transform_json(json_hash['releaseDate'], json_hash['_releaseDate']) unless json_hash['releaseDate'].nil?      

      result
    end
  end
end
