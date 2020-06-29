module FHIR
  # fhir/contact_point_system.rb
  class ContactPointSystem < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ContactPointSystem'
    field :value, type: String

    def self.transform_json(json_hash, target=ContactPointSystem.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
