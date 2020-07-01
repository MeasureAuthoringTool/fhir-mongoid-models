module FHIR
  # fhir/value_set_expansion_contains.rb
  class ValueSetExpansionContains < BackboneElement
    include Mongoid::Document
    embeds_one :system, class_name: 'PrimitiveUri'
    embeds_one :abstract, class_name: 'PrimitiveBoolean'
    embeds_one :inactive, class_name: 'PrimitiveBoolean'
    embeds_one :version, class_name: 'PrimitiveString'
    embeds_one :code, class_name: 'PrimitiveCode'
    embeds_one :display, class_name: 'PrimitiveString'
    embeds_many :designation, class_name: 'ValueSetComposeIncludeConceptDesignation'
    embeds_many :contains, class_name: 'ValueSetExpansionContains'

    def self.transform_json(json_hash, target = ValueSetExpansionContains.new)
      result = self.superclass.transform_json(json_hash, target)
      result['system'] = PrimitiveUri.transform_json(json_hash['system'], json_hash['_system']) unless json_hash['system'].nil?      
      result['abstract'] = PrimitiveBoolean.transform_json(json_hash['abstract'], json_hash['_abstract']) unless json_hash['abstract'].nil?      
      result['inactive'] = PrimitiveBoolean.transform_json(json_hash['inactive'], json_hash['_inactive']) unless json_hash['inactive'].nil?      
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?      
      result['code'] = PrimitiveCode.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?      
      result['display'] = PrimitiveString.transform_json(json_hash['display'], json_hash['_display']) unless json_hash['display'].nil?      
      result['designation'] = json_hash['designation'].map { |var| ValueSetComposeIncludeConceptDesignation.transform_json(var) } unless json_hash['designation'].nil?
      result['contains'] = json_hash['contains'].map { |var| ValueSetExpansionContains.transform_json(var) } unless json_hash['contains'].nil?

      result
    end
  end
end
