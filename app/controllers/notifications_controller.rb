class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    fcm = FCM.new('AIzaSyB2zA4TL9napLFnR0cNI_I9gcdfg9qmZ6g')
    # you can set option parameters in here
    #  - all options are pass to HTTParty method arguments
    #  - ref: https://github.com/jnunemaker/httparty/blob/master/lib/httparty.rb#L29-L60
    #  fcm = FCM.new("my_api_key", timeout: 3)

    registration_ids= ['eE-sNZUdfMc'] # an array of one or more client registration tokens
    options = {data: {score: "123"}, collapse_key: "updated_score"}
    @response = fcm.send(registration_ids, options)
  end

  def create
  end

  def show
  end
end
