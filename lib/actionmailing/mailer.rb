module ActionMailing
  module Mailer
    extend ActiveSupport::Concern

    included do
      around_action :build_message
    end

    private

    def build_message
      # This returns an instance of Mail::Message
      mailing = yield
      return unless mailing.is_a?(ActionMailing::Mailing)

      attachments = mailing.attachments

      mail(
        to: mailing.to,
        subject: mailing.subject,
        reply_to: mailing.reply_to
      ) do |format|
        format.html { render layout: mailing.layout, locals: { mailing: mailing } }
      end
    end
  end
end
