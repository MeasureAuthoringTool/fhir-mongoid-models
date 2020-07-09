module FHIR
  # fhir/coding.rb
  class Coding < Element
    include Mongoid::Document
    embeds_one :system, class_name: 'FHIR::PrimitiveUri'
    embeds_one :version, class_name: 'FHIR::PrimitiveString'
    embeds_one :code, class_name: 'FHIR::PrimitiveCode'
    embeds_one :display, class_name: 'FHIR::PrimitiveString'
    embeds_one :userSelected, class_name: 'FHIR::PrimitiveBoolean'

    def self.transform_json(json_hash, target = Coding.new)
      result = self.superclass.transform_json(json_hash, target)
      result['system'] = PrimitiveUri.transform_json(json_hash['system'], json_hash['_system']) unless json_hash['system'].nil?      
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?      
      result['code'] = PrimitiveCode.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?      
      result['display'] = PrimitiveString.transform_json(json_hash['display'], json_hash['_display']) unless json_hash['display'].nil?      
      result['userSelected'] = PrimitiveBoolean.transform_json(json_hash['userSelected'], json_hash['_userSelected']) unless json_hash['userSelected'].nil?      

      result
    end
  end
end
