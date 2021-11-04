class Comment < ApplicationRecord
  include Visible
  # Each comment created belong to a specific article
  belongs_to :article

end

# rails generate model Article commenter:string body:text

# Generated properties
# commenter: string
# body: text
# status: string