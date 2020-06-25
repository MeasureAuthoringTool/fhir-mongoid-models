module FHIR
  # fhir/data_requirement_date_filter.rb
  class DataRequirementDateFilter < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DataRequirementDateFilter'
    embeds_one :path, class_name: 'PrimitiveString'
    embeds_one :searchParam, class_name: 'PrimitiveString'
    embeds_one :valuedateTime, class_name: 'PrimitiveDateTime'
    embeds_one :valuePeriod, class_name: 'Period'
    embeds_one :valueDuration, class_name: 'Duration'

    def self.transform_json(json_hash)
      result = DataRequirementDateFilter.new
      result['path'] = PrimitiveString.transform_json(json_hash['path'], json_hash['_path']) unless json_hash['path'].nil?      
      result['searchParam'] = PrimitiveString.transform_json(json_hash['searchParam'], json_hash['_searchParam']) unless json_hash['searchParam'].nil?      
      result['valuedateTime'] = PrimitiveDateTime.transform_json(json_hash['valuedateTime'], json_hash['_valuedateTime']) unless json_hash['valuedateTime'].nil?      
      result['valuePeriod'] = Period.transform_json(json_hash['valuePeriod']) unless json_hash['valuePeriod'].nil?      
      result['valueDuration'] = Duration.transform_json(json_hash['valueDuration']) unless json_hash['valueDuration'].nil?      

      result
    end
  end
end
