module FHIR
  # fhir/period.rb
  class Period < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'Period'
    embeds_one :start, class_name: 'PrimitiveDateTime'
    embeds_one :end, class_name: 'PrimitiveDateTime'

    def self.transform_json(json_hash, target=Period.new)
      result = self.superclass.transform_json(json_hash, target)
      result['start'] = PrimitiveDateTime.transform_json(json_hash['start'], json_hash['_start']) unless json_hash['start'].nil?      
      result['end'] = PrimitiveDateTime.transform_json(json_hash['end'], json_hash['_end']) unless json_hash['end'].nil?      

      result
    end
  end
end
