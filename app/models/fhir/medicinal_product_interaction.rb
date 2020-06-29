module FHIR
  # fhir/medicinal_product_interaction.rb
  class MedicinalProductInteraction < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductInteraction'
    embeds_many :subject, class_name: 'Reference'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_many :interactant, class_name: 'MedicinalProductInteractionInteractant'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :effect, class_name: 'CodeableConcept'
    embeds_one :incidence, class_name: 'CodeableConcept'
    embeds_one :management, class_name: 'CodeableConcept'

    def self.transform_json(json_hash, target=MedicinalProductInteraction.new)
      result = self.superclass.transform_json(json_hash, target)
      result['subject'] = json_hash['subject'].map { |var| Reference.transform_json(var) } unless json_hash['subject'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['interactant'] = json_hash['interactant'].map { |var| MedicinalProductInteractionInteractant.transform_json(var) } unless json_hash['interactant'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['effect'] = CodeableConcept.transform_json(json_hash['effect']) unless json_hash['effect'].nil?      
      result['incidence'] = CodeableConcept.transform_json(json_hash['incidence']) unless json_hash['incidence'].nil?      
      result['management'] = CodeableConcept.transform_json(json_hash['management']) unless json_hash['management'].nil?      

      result
    end
  end
end
