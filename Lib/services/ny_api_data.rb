require 'httparty'
require 'json'
require 'dotenv'
Dotenv.load('ny_project/.env')

# This class will hold api data
class NYAPIData
  include HTTParty
  base_uri 'https://api.nytimes.com/svc/movies/v2'

  def retrieve_api(movie_name,api_key)
    @json_data = JSON.parse(self.class.get("/reviews/search.json?query=#{movie_name}&api-key=#{api_key}").body)
  end

  def retrieve_api_data
    @json_data['results']
  end

  def retrieve_publication_date_data
    date_array = []
    retrieve_api_data.each do |result|
    date_array << result['publication_date']
  end
    date_array
  end

  def amount_of_entries
    @json_data['results'].length
  end
  def retrieve_title_data
    title_array = []
    retrieve_api_data.each do |result|
      title_array << result['display_title']
    end
    title_array
  end

  def retrieve_mppa_rating_data
    rating_array = []
    retrieve_api_data.each do |result|
      rating_array << result['mpaa_rating']
    end
    rating_array
  end
end
# p ny_key = ENV['API_KEY']
# bob = NYAPIData.new
# bob.retrieve_api('gladiator', ny_key)

# p bob.retrieve_publication_date_data
# p bob.amount_of_entries
# p bob.retrieve_title_data
# p bob.retrieve_publication_date_data