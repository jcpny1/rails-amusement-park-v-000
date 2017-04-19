class RidesController < ApplicationController
  def create
    user = User.find_by(id: params[:user_id])
    attraction = Attraction.find_by(id: params[:attraction_id])

    ride = user.rides.new(user_id: user.id, attraction_id: attraction.id)
    ride_status = ride.take_ride

    if ride_status == true
      flash[:alert] = "Thanks for riding the #{attraction.name}!"
    else
      flash[:alert] = ride_status
    end

    redirect_to user
  end
end
