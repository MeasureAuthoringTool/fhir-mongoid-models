module FHIR
  # fhir/list_status.rb
  class ListStatus < Element
    include Mongoid::Document
    field :value, type: String

    def self.transform_json(json_hash, target = ListStatus.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
