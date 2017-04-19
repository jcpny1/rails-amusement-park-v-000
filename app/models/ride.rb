class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    negative_response = ''

    if self.attraction.tickets > self.user.tickets
      negative_response << " You do not have enough tickets to ride the #{attraction.name}."
    end

    if self.attraction.min_height > self.user.height
      negative_response << " You are not tall enough to ride the #{attraction.name}."
    end

    if negative_response.present?
      "Sorry.#{negative_response}"
    else
      self.user.update(
        tickets:   (self.user.tickets   - self.attraction.tickets),
        nausea:    (self.user.nausea    + self.attraction.nausea_rating),
        happiness: (self.user.happiness + self.attraction.happiness_rating) )
    end
  end

end
