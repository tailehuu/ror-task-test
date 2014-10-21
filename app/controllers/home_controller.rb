class HomeController < ApplicationController
  def index
  end

  def createDigit
    @number = params[:number]
    @new_number = Utility.create_check_digit(@number)
  end

  def checkDigit
    @number = params[:number]
    @is_valid = Utility.check_credit_card_number(@number)
  end
end
