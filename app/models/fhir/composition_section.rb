module FHIR
  # fhir/composition_section.rb
  class CompositionSection < BackboneElement
    include Mongoid::Document
    embeds_one :title, class_name: 'FHIR::PrimitiveString'
    embeds_one :code, class_name: 'FHIR::CodeableConcept'
    embeds_many :author, class_name: 'FHIR::Reference'
    embeds_one :focus, class_name: 'FHIR::Reference'
    embeds_one :text, class_name: 'FHIR::Narrative'
    embeds_one :mode, class_name: 'FHIR::SectionMode'
    embeds_one :orderedBy, class_name: 'FHIR::CodeableConcept'
    embeds_many :entry, class_name: 'FHIR::Reference'
    embeds_one :emptyReason, class_name: 'FHIR::CodeableConcept'
    embeds_many :section, class_name: 'FHIR::CompositionSection'

    def self.transform_json(json_hash, target = CompositionSection.new)
      result = self.superclass.transform_json(json_hash, target)
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?      
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['author'] = json_hash['author'].map { |var| Reference.transform_json(var) } unless json_hash['author'].nil?
      result['focus'] = Reference.transform_json(json_hash['focus']) unless json_hash['focus'].nil?      
      result['text'] = Narrative.transform_json(json_hash['text']) unless json_hash['text'].nil?      
      result['mode'] = SectionMode.transform_json(json_hash['mode']) unless json_hash['mode'].nil?      
      result['orderedBy'] = CodeableConcept.transform_json(json_hash['orderedBy']) unless json_hash['orderedBy'].nil?      
      result['entry'] = json_hash['entry'].map { |var| Reference.transform_json(var) } unless json_hash['entry'].nil?
      result['emptyReason'] = CodeableConcept.transform_json(json_hash['emptyReason']) unless json_hash['emptyReason'].nil?      
      result['section'] = json_hash['section'].map { |var| CompositionSection.transform_json(var) } unless json_hash['section'].nil?

      result
    end
  end
end
