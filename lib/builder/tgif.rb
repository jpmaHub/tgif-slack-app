module Builder
  class Tgif
    attr_accessor :tgif_details

    def build
      tgif = Domain::Tgif.new
      tgif.id = tgif_details[:id]
      tgif.team_name = tgif_details[:team_name]
      tgif.message = tgif_details[:message]
      tgif.created_at = tgif_details[:created_at]
      tgif.slack_user_id = tgif_details[:slack_user_id]
      tgif
    end

    def from(id: nil, team_name:, message:)
      @tgif_details = {
          id: id,
          team_name: team_name,
          message: message,
      }
    end

    def build_tgif(team_name:, message:, slack_user_id:)
      @tgif_details = {
          team_name: team_name,
          message: message,
          slack_user_id: slack_user_id
      }
    end
  end
end