class CallResponse
  RESPONSE_METHOD = "GET".freeze

  FOWARD_ACTION_URL = Rails.application.routes.url_helpers.public_send(:inbound_voicemail_url).freeze
  FOWARD_TIMEOUT = 10.freeze

  VOICEMAIL_MAX_LENGTH = 60.freeze
  VOICEMAIL_MESSAGE = "Leave your message after the tone".freeze
  VOICEMAIL_ACTION_URL = Rails.application.routes.url_helpers.public_send(:inbound_record_voicemail_url).freeze

  def self.foward(from, to)
    response = Plivo::Response.new

    dial = response.addDial(
      {
        callerId: from,
        action: FOWARD_ACTION_URL,
        method: RESPONSE_METHOD,
        timeout: FOWARD_TIMEOUT
      }
    )

    dial.addUser(to)

    response.to_xml
  end

  def self.voicemail
    response = Plivo::Response.new

    response.addSpeak(VOICEMAIL_MESSAGE)
    response.addRecord(
      {
        action: VOICEMAIL_ACTION_URL,
        method: RESPONSE_METHOD,
        maxLength: VOICEMAIL_MAX_LENGTH
      }
    )

    response.to_xml
  end
end
