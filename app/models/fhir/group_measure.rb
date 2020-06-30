module FHIR
  # fhir/group_measure.rb
  class GroupMeasure < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'GroupMeasure'
    field :value, type: String

    def self.transform_json(json_hash, target=GroupMeasure.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
