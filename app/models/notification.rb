class Notification < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :contacts
  before_save :send_notification

  validates :text, presence: true
  
  private
    def send_notification

      if self.user.contacts
        registration_ids = [] # an array of one or more client registration tokens
        self.user.contacts.each do |contact|
          registration_ids.push(contact.token)
        end

        fcm = FCM.new('AIzaSyB2zA4TL9napLFnR0cNI_I9gcdfg9qmZ6g', verify: false)
        # you can set option parameters in here
        #  - all options are pass to HTTParty method arguments
        #  - ref: https://github.com/jnunemaker/httparty/blob/master/lib/httparty.rb#L29-L60
        #  fcm = FCM.new("my_api_key", timeout: 3)

        options = {notification: {title: self.title, body: self.text}}
        self.response = fcm.send(registration_ids, options)
      end
    end
end
