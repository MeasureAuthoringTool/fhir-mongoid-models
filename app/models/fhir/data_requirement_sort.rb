module FHIR
  # fhir/data_requirement_sort.rb
  class DataRequirementSort < Element
    include Mongoid::Document
    embeds_one :path, class_name: 'PrimitiveString'
    embeds_one :direction, class_name: 'SortDirection'

    def self.transform_json(json_hash, target = DataRequirementSort.new)
      result = self.superclass.transform_json(json_hash, target)
      result['path'] = PrimitiveString.transform_json(json_hash['path'], json_hash['_path']) unless json_hash['path'].nil?      
      result['direction'] = SortDirection.transform_json(json_hash['direction']) unless json_hash['direction'].nil?      

      result
    end
  end
end
