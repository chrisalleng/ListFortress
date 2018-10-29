class Tournament < ApplicationRecord
  has_many :participants
  belongs_to :format
  belongs_to :version, optional: true
  belongs_to :tournament_type
  attr_accessor :participant_number

  def create_empty_squads
    return if participant_number.to_i.zero?
    participant_number.to_i.times do |i|
      Participant.new(swiss_rank: i + 1, tournament_id: id).save
    end
  end

  def get_json_from_tabletop(url)
    response = HTTParty.get(url)
    JSON(response.parsed_response)
  end

  def create_participant_from_tabletop(player_hash)

  end

  def participants_from_tabletop(url)
    tabletop_hash = get_json_from_tabletop(url)

    tabletop_hash['tournament']['players'].each do |player_hash|
      create_participant_from_tabletop(player_hash)
    end
  end

end
