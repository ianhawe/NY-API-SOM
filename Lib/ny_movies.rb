require_relative 'services/ny_api_data'
# This is the super class which runs the NYAPIData class.
class NYMovies
  def ny_api_data
    NYAPIData.new
  end
end
