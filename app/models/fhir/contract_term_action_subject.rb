module FHIR
  # fhir/contract_term_action_subject.rb
  class ContractTermActionSubject < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ContractTermActionSubject'
    embeds_many :reference, class_name: 'Reference'
    embeds_one :role, class_name: 'CodeableConcept'

    def self.transform_json(json_hash)
      result = ContractTermActionSubject.new
      result['reference'] = json_hash['reference'].map { |var| Reference.transform_json(var) } unless json_hash['reference'].nil?
      result['role'] = CodeableConcept.transform_json(json_hash['role']) unless json_hash['role'].nil?      

      result
    end
  end
end
