module FHIR
  # fhir/use.rb
  class Use < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'Use'
    field :value, type: String

    def self.transform_json(json_hash, target=Use.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
