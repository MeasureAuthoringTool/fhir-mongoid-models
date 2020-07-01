module FHIR
  # fhir/terminology_capabilities_code_system_version_filter.rb
  class TerminologyCapabilitiesCodeSystemVersionFilter < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'PrimitiveCode'
    embeds_many :op, class_name: 'PrimitiveCode'

    def self.transform_json(json_hash, target = TerminologyCapabilitiesCodeSystemVersionFilter.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = PrimitiveCode.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?      
      result['op'] = json_hash['op'].each_with_index.map do |var, i|
        extension_hash = json_hash['_op'] && json_hash['_op'][i]
        PrimitiveCode.transform_json(var, extension_hash)
      end unless json_hash['op'].nil?

      result
    end
  end
end
