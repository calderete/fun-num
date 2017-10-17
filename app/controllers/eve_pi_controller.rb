class EvePiController < ApplicationController
  def menu
   #render json: {message: "eve pi" }
   render :eve_pi_menu
  end
end
