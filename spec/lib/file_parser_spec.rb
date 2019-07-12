require 'spec_helper'
require 'file_parser'

RSpec.describe ParseUtils::FileParser do
  let(:valid_file_path){'spec/test_log/dummy_web.log'}
  let(:invalid_file_path){'/dummy_web.log'}
  let(:valid_result){ described_class.parse_file(valid_file_path)}
  let(:invalid_result){ described_class.parse_file(invalid_file_path)}
  let(:empty_result){nil}
  let(:expected_result){{ "/about" => ["682.704.613.213", "802.683.925.780"],
    "/about/2" => ["061.945.150.735", "543.910.244.929", "184.123.665.067"],
    "/contact" => ["126.318.035.038"],"/help_page/1" => ["200.017.277.774"],
    "/home" => ["126.318.035.038", "451.106.204.921", "200.017.277.774"],
    "/index" => ["336.284.013.698", "444.701.448.104"]
  }}

  describe 'parse_file'  do
    context "When valid file path" do
      it "Should not return nil" do
        expect(valid_result).not_to be(nil)
      end
      it "Should return hash object with :path => ip" do
        expect(valid_result).to eq(expected_result)
      end
    end
    context "When Invalid file path" do
      it "Should return nil" do
        expect(invalid_result).to eq(empty_result)
      end
      it "Should return hash object" do
        expect(invalid_result).to eq(empty_result)
      end
    end
  end
end