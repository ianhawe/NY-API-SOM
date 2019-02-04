require_relative 'spec_helper'

describe 'NY Movies API' do
  before(:all) do
   @api_data = NYMovies.new.ny_api_data
   @api_data.retrieve_api("gladiator",ENV['API_KEY'])
  end
  context 'Testing Data from different outputs of the API' do
    it 'Testing whether or not the date returns a String' do
      @api_data.retrieve_publication_date_data.each do |date|
        expect(date).to be_kind_of(String)
      end
    end
    it 'Testing whether or not the title returns a String' do
      @api_data.retrieve_title_data.each do |title|
        expect(title).to be_kind_of(String)
      end
    end
    it 'Testing whether or not the rating returns a String' do
      @api_data.retrieve_mppa_rating_data.each do |rating|
        expect(rating).to be_kind_of(String)
      end
    end
  end
end
