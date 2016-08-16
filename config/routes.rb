Rails.application.routes.draw do
  get '/inbound/foward' => 'inbound#foward'
  get '/inbound/voicemail' => 'inbound#voicemail'
  get '/inbound/record_voicemail' => 'inbound#record_voicemail'
  get '/inbound/hangup' => 'inbound#hangup'
end
