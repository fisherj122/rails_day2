class HilowController < ApplicationController

  def index
    if cookies[:random].nil?
      @random_number = Random.new.rand(100)
    else
      @random_number = cookies[:random].to_i
    end

    if cookies[:random].nil?
      cookies[:random] = @random_number
    end

    @guess = params[:guess]

    if !@guess.nil? && @guess != ""
      if @guess.to_i == @random_number
        @result = "is correct! You win!"
      elsif @guess.to_i > @random_number
        @result = "is too high. Try again."
      else
        @result = "is too low. Try again."
      end
    else
      flash.now[:alert] = "Please Enter a Number Between 0-100"
    end

  end

end
