class Article < ApplicationRecord
  include Visible
  # Establish 2 way relationships
  # Article can have many comments
  has_many :comments, dependent: :destroy # This is plural? Why?


  # Rails provide default validations. If none of these requirements are met, form will abort and no data are saved
  # Think of this as second layer security check. It perform a check after the form is submitted but before saving it to the database
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

end

# rails generate model Article title:string body:text

# Generated properties
# title: string
# body: text
# status: string