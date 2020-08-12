RSpec.describe FHIR::Library do
  it 'Should be able to construct a library from library resource' do
    library_json = File.open(File.join(File.dirname(__FILE__), '../fixture/library.json'))
    library_hash = JSON.load library_json
    library = FHIR::Library.transform_json library_hash
    expect do
      library.save!
    end.to_not raise_error
    expect(library._id).to be_present
    expect(library.name.value).to eq library_hash['name']

    updated_library_json = library.to_json
    updated_library_hash =  JSON.load updated_library_json
    updated_library = FHIR::Library.transform_json updated_library_hash
    expect(updated_library).to be_present
    expect(updated_library_hash).to eq library_hash
  end

  describe "#create_data_elements" do
    def build_library(data_requirements)
      library_json = File.open(File.join(File.dirname(__FILE__), '../fixture/library.json'))
      library_hash = JSON.load library_json
      library_hash['dataRequirement'] = data_requirements

      FHIR::Library.transform_json library_hash
    end

    def build_fhir_value_sets(properties)
      fhir_value_set_json = File.open(File.join(File.dirname(__FILE__), '../fixture/fhir_value_set.json'))
      fhir_value_set_hash = JSON.load fhir_value_set_json
      properties.map do |props|
        current = fhir_value_set_hash.clone
        current['id'] = props['id']
        current['name'] = props['name']

        FHIR::ValueSet.transform_json current
      end
    end

    context "given a library with dataRequirements that have valid codeFilter and valueSet values" do
      before :each do
        @library = build_library([
          {
            "type" => "MedicationRequest",
            "codeFilter" => [
              {
                "path" => "medication",
                "valueSet" => "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.201"
              }
            ]
          },
          {
            "type" => "Encounter",
            "codeFilter" => [
              {
                "path" => "code",
                "valueSet" => "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.307"
              }
            ]
          }
        ])

        @fhir_value_sets = build_fhir_value_sets([
          {'id' => '2.16.840.1.113883.3.117.1.7.1.201', 'name' => 'Antithrombotic Therapy'},
          {'id' => '2.16.840.1.113883.3.666.5.307', 'name' => 'Encounter Inpatient'}
        ])
      end

      it "builds and returns the expected CQM::DataElements" do
        expect(CQM::DataElement.count).to be 0
        expect(FHIR::MedicationRequest.count).to be 0
        expect(FHIR::Encounter.count).to be 0
        elements = @library.create_data_elements(@fhir_value_sets)
        expect(CQM::DataElement.count).to be 0

        expect(FHIR::MedicationRequest.count).to be 1
        expect(FHIR::Encounter.count).to be 1
        expect(elements[0].codeListId).to eq "2.16.840.1.113883.3.117.1.7.1.201"
        expect(elements[0].valueSetTitle).to eq "Antithrombotic Therapy"
        expect(elements[0].description).to eq "MedicationRequest: Antithrombotic Therapy"
        expect(elements[0].fhir_resource).to eq FHIR::MedicationRequest.first

        expect(elements[1].codeListId).to eq "2.16.840.1.113883.3.666.5.307"
        expect(elements[1].valueSetTitle).to eq "Encounter Inpatient"
        expect(elements[1].description).to eq "Encounter: Encounter Inpatient"
        expect(elements[1].fhir_resource).to eq FHIR::Encounter.first
      end
    end

    context "given a library with at least one dataRequirement that has a valid codeFilter but no valueSet" do
      before :each do
        @library = build_library([
          {
            "type" => "MedicationRequest",
            "codeFilter" => [
              {
                "path" => "medication"
              }
            ]
          }
        ])

        @fhir_value_sets = build_fhir_value_sets([
          {'id' => '2.16.840.1.113883.3.117.1.7.1.201', 'name' => 'Antithrombotic Therapy'}
        ])
      end

      it "builds and returns the expected CQM::DataElements" do
        expect(CQM::DataElement.count).to be 0
        expect(FHIR::MedicationRequest.count).to be 0
        elements = @library.create_data_elements(@fhir_value_sets)
        expect(CQM::DataElement.count).to be 0

        expect(FHIR::MedicationRequest.count).to be 1
        expect(elements[0].codeListId).to eq ""
        expect(elements[0].valueSetTitle).to eq nil
        expect(elements[0].description).to eq "MedicationRequest: "
        expect(elements[0].fhir_resource).to eq FHIR::MedicationRequest.first
      end
    end

    context "given a library with at least one dataRequirement that has no codeFilter" do
      before :each do
        @library = build_library([
          {
            "type" => "Condition"
          }
        ])

        @fhir_value_sets = build_fhir_value_sets([
          {'id' => '2.16.840.1.113883.3.117.1.7.1.201', 'name' => 'Antithrombotic Therapy'}
        ])
      end

      it "builds and returns the expected CQM::DataElements" do
        expect(CQM::DataElement.count).to be 0
        expect(FHIR::Condition.count).to be 0
        elements = @library.create_data_elements(@fhir_value_sets)
        expect(CQM::DataElement.count).to be 0

        expect(FHIR::Condition.count).to be 1
        expect(elements[0].codeListId).to eq ""
        expect(elements[0].valueSetTitle).to eq nil
        expect(elements[0].description).to eq "Condition: "
        expect(elements[0].fhir_resource).to eq FHIR::Condition.first
      end
    end
  end
end
