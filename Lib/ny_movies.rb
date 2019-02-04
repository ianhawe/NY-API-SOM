require_relative 'services/ny_api_data'
class NYMovies
  def ny_api_data
    NYAPIData.new 
  end
end