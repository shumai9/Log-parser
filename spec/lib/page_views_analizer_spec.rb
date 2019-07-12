require 'spec_helper'
require 'file_parser'

RSpec.describe ParseUtils::PageViewsAnalizer do
  let(:valid_file_path){'spec/test_log/dummy_web.log'}
  let(:valid_parsed_data){ParseUtils::FileParser.parse_file(valid_file_path)}
  let(:page_count){described_class.count_page_views(valid_parsed_data)}
  let(:desc_sorted_views){described_class.sort_page_views(page_count, opt = true)}
  let(:asce_sorted_views){described_class.sort_page_views(page_count, opt = false)}
  let(:unique_sorted_views){described_class.filter_unique_views(desc_sorted_views)}

  let(:expected_result){{"/about/2" => 3,"/home" => 3,"/about" => 2,
                        "/index" => 2,"/contact" => 1,"/help_page/1" => 1}}
  let(:unique_views){{"/about/2" => 3, "/help_page/1" => 1}}

  describe 'count_page_views'  do
    context "When valid parsed data" do
      it "Should not return nil" do
        expect(valid_parsed_data).not_to be(nil)
      end
      it "should return obj with number of views #path => count" do
        expect(page_count).to eq(expected_result)
      end
    end
  end
  describe 'sort_page_views'  do
    context "Given count of page_views with Desc = true" do
      it"sorts page views in descending order"do
        expect(desc_sorted_views).to match(expected_result)
      end
    end
    context "Given count of page_views with Desc = false" do
      it"sorts page views in Ascending order"do
        expect(asce_sorted_views).to match(expected_result)
      end
    end
  end
  describe 'filter unique views' do
    context "Given count of page_views" do
      it"Should return uniqe page_views only"do
        expect(unique_sorted_views).to match(unique_views)
      end
    end
  end
end

