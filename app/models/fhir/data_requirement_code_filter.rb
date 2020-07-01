module FHIR
  # fhir/data_requirement_code_filter.rb
  class DataRequirementCodeFilter < Element
    include Mongoid::Document
    embeds_one :path, class_name: 'PrimitiveString'
    embeds_one :searchParam, class_name: 'PrimitiveString'
    embeds_one :valueSet, class_name: 'PrimitiveCanonical'
    embeds_many :code, class_name: 'Coding'

    def self.transform_json(json_hash, target = DataRequirementCodeFilter.new)
      result = self.superclass.transform_json(json_hash, target)
      result['path'] = PrimitiveString.transform_json(json_hash['path'], json_hash['_path']) unless json_hash['path'].nil?      
      result['searchParam'] = PrimitiveString.transform_json(json_hash['searchParam'], json_hash['_searchParam']) unless json_hash['searchParam'].nil?      
      result['valueSet'] = PrimitiveCanonical.transform_json(json_hash['valueSet'], json_hash['_valueSet']) unless json_hash['valueSet'].nil?      
      result['code'] = json_hash['code'].map { |var| Coding.transform_json(var) } unless json_hash['code'].nil?

      result
    end
  end
end
