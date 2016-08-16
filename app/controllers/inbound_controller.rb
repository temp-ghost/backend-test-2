class InboundController < ActionController::Base
  HANGUP_CAUSE_NORMAL = "NORMAL_CLEARING".freeze
  HANGUP_CAUSE_CLIENT = "ORIGINATOR_CANCEL".freeze

  before_action :set_call_history, only: [:hangup, :voicemail, :record_voicemail]

  layout nil

  def foward
    user = User.find_by_department_sip_endpoint(params[:To])
    create_call_history(user)

    render inline: CallResponse.foward(params[:From], user.user_number.sip_endpoint)
  end

  def voicemail
    # Don't start voicemail if the cause of the hang up was normal
    # i.e. Start it if the call was rejected or didn't had an answer
    return head(:ok) if [HANGUP_CAUSE_NORMAL, HANGUP_CAUSE_CLIENT].include?(params[:DialHangupCause])

    # Update enum in DB
    @call.voicemail!

    render inline: CallResponse.voicemail
  end

  def hangup
    # Only update call if it was ended normally
    @call.update(
      duration: params[:Duration],
      call_status: call_status
    ) unless @call.voicemail?

    head :ok
  end

  def record_voicemail
    @call.create_voicemail(
      url: params[:RecordUrl],
      duration: params[:RecordingDuration]
    )

    head :created
  end

  private

  def set_call_history
    @call = CallHistory.find_by_call_uuid(params[:CallUUID])
  end

  def create_call_history(user)
    # Save call in history
    user.call_histories.create(
      call_uuid: params[:CallUUID],
      customer_sip_endpoint: params[:From]
    )
  end

  def call_status
    return :cancel if params[:HangupCause] == HANGUP_CAUSE_CLIENT

    :answer
  end
end
