require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score

    # the words has to be in the grid? somehow find out what letters were displayed?
    # check if the words are in the grid
    # check if that words is an english word

    @word = params[:word].upcase
    @letters = params[:letters]
    result = URI.open("https://dictionary.lewagon.com/#{@word}").read
    @data = JSON.parse(result)
    @english_word = @data["found"]


    @in_grid = @word.chars.all? do |letter|
      @letters.include?(letter)
    end
  end
end
