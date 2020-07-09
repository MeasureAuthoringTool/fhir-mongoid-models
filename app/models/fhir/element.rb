module FHIR
  # fhir/element.rb
  class Element
    include Mongoid::Document
    field :id, type: String
    embeds_many :extension, class_name: 'FHIR::Extension'

    def self.transform_json(json_hash, target = Element.new)
      result = target
      result['id'] = json_hash['id'] unless json_hash['id'].nil?
      result['extension'] = json_hash['extension'].map { |var| Extension.transform_json(var) } unless json_hash['extension'].nil?

      result
    end
  end
end
