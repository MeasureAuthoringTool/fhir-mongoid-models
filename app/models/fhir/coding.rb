module FHIR
  # fhir/coding.rb
  class Coding < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'Coding'
    embeds_one :system, class_name: 'PrimitiveUri'
    embeds_one :version, class_name: 'PrimitiveString'
    embeds_one :code, class_name: 'PrimitiveCode'
    embeds_one :display, class_name: 'PrimitiveString'
    embeds_one :userSelected, class_name: 'PrimitiveBoolean'

    def self.transform_json(json_hash)
      result = Coding.new
      result['system'] = PrimitiveUri.transform_json(json_hash['system'], json_hash['_system']) unless json_hash['system'].nil?      
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?      
      result['code'] = PrimitiveCode.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?      
      result['display'] = PrimitiveString.transform_json(json_hash['display'], json_hash['_display']) unless json_hash['display'].nil?      
      result['userSelected'] = PrimitiveBoolean.transform_json(json_hash['userSelected'], json_hash['_userSelected']) unless json_hash['userSelected'].nil?      

      result
    end
  end
end
