require 'net/http'
require 'json'

class WeatherController < ApplicationController
  API_KEY = "463075056a5ffa4fb6e130e34523c15f"
  BASE_URL = "http://api.openweathermap.org/data/2.5/weather"

  def index

  end

  def fetch
    @city = params[:city]
    puts "City: #{@city}"
    @weather_data = fetch_weather(@city)
    puts "Weather Data: #{@weather_data.inspect}"
    render :index
  end


  private

  def fetch_weather(city)
    url = URI("#{BASE_URL}?q=#{city}&appid=#{API_KEY}&units=metric")
    response = Net::HTTP.get(url)
    JSON.parse(response)
  end
end
