module FHIR
  # fhir/value_set_compose_include.rb
  class ValueSetComposeInclude < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ValueSetComposeInclude'
    embeds_one :system, class_name: 'PrimitiveUri'
    embeds_one :version, class_name: 'PrimitiveString'
    embeds_many :concept, class_name: 'ValueSetComposeIncludeConcept'
    embeds_many :filter, class_name: 'ValueSetComposeIncludeFilter'
    embeds_many :valueSet, class_name: 'PrimitiveCanonical'

    def self.transform_json(json_hash)
      result = ValueSetComposeInclude.new
      result['system'] = PrimitiveUri.transform_json(json_hash['system'], json_hash['_system']) unless json_hash['system'].nil?      
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?      
      result['concept'] = json_hash['concept'].map { |var| ValueSetComposeIncludeConcept.transform_json(var) } unless json_hash['concept'].nil?
      result['filter'] = json_hash['filter'].map { |var| ValueSetComposeIncludeFilter.transform_json(var) } unless json_hash['filter'].nil?
      result['valueSet'] = json_hash['valueSet'].each_with_index.map do |var, i|
        extension_hash = json_hash['_valueSet'] && json_hash['_valueSet'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['valueSet'].nil?

      result
    end
  end
end
