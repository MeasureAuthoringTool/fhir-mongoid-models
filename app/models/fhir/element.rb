module FHIR
  # fhir/element.rb
  class Element
    include Mongoid::Document
    field :typeName, type: String, default: 'Element'
    field :id, type: String
    embeds_many :extension, class_name: 'Extension'

    def self.transform_json(json_hash)
      result = Element.new
      result['id'] = json_hash['id'] unless json_hash['id'].nil?
      result['extension'] = json_hash['extension'].map { |var| Extension.transform_json(var) } unless json_hash['extension'].nil?

      result
    end
  end
end
