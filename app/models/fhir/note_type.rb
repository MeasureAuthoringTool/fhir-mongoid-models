module FHIR
  # fhir/note_type.rb
  class NoteType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'NoteType'
    field :value, type: String

    def self.transform_json(json_hash, target=NoteType.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
