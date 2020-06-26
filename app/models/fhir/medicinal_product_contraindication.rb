module FHIR
  # fhir/medicinal_product_contraindication.rb
  class MedicinalProductContraindication < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductContraindication'
    embeds_many :subject, class_name: 'Reference'
    embeds_one :disease, class_name: 'CodeableConcept'
    embeds_one :diseaseStatus, class_name: 'CodeableConcept'
    embeds_many :comorbidity, class_name: 'CodeableConcept'
    embeds_many :therapeuticIndication, class_name: 'Reference'
    embeds_many :otherTherapy, class_name: 'MedicinalProductContraindicationOtherTherapy'
    embeds_many :population, class_name: 'Population'

    def self.transform_json(json_hash)
      result = MedicinalProductContraindication.new
      result['subject'] = json_hash['subject'].map { |var| Reference.transform_json(var) } unless json_hash['subject'].nil?
      result['disease'] = CodeableConcept.transform_json(json_hash['disease']) unless json_hash['disease'].nil?      
      result['diseaseStatus'] = CodeableConcept.transform_json(json_hash['diseaseStatus']) unless json_hash['diseaseStatus'].nil?      
      result['comorbidity'] = json_hash['comorbidity'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['comorbidity'].nil?
      result['therapeuticIndication'] = json_hash['therapeuticIndication'].map { |var| Reference.transform_json(var) } unless json_hash['therapeuticIndication'].nil?
      result['otherTherapy'] = json_hash['otherTherapy'].map { |var| MedicinalProductContraindicationOtherTherapy.transform_json(var) } unless json_hash['otherTherapy'].nil?
      result['population'] = json_hash['population'].map { |var| Population.transform_json(var) } unless json_hash['population'].nil?

      result
    end
  end
end
