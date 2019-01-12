module ActionMailing
RSpec.describe ActionMailer do
  it "has a version number" do
    mailer = Class.new(ActionMailer::Base) do
      include ActionMailing::Mailer

      def welcome(user)
        WelcomeMailing.new(user)
      end
    end

    user = double('user',
                  email: "user@example.com")
    mailer.welcome(user)
  end
end
