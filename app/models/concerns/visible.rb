module Visible
  extend ActiveSupport::Concern

  # This file act like a component but not exactly like partials because it contains a list of rules
  # In this case, we're checking in every model whether to show or not to show a post depend on the post status
  # Model will directly inherit it, and you can conditionally render things in view
  # In this case, we had to add a additional property onto both article and comment models.
  # The new property is [status: string]

  VALID_STATUSES = ['public', 'private', 'archived']

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  class_methods do
    def public_count
      where(status: 'public').count
    end
  end

  def archived?
    status == 'archived'
  end
end
