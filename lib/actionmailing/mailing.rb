# frozen_string_literal: true

module ActionMailing
  module Mailing
    def attachments
      # override in subclass if mail has attachments
      {}
    end

    private

    def t(*args)
      I18n.t(*args)
    end
  end
end
