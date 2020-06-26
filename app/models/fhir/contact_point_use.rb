module FHIR
  # fhir/contact_point_use.rb
  class ContactPointUse < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ContactPointUse'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ContactPointUse.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
