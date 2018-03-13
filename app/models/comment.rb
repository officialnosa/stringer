require "net/http"
# require "uri"
require "json"

class Comment < ActiveRecord::Base
  # define_attribute_method :user

  belongs_to :story

  validates_uniqueness_of :user_id

  UNTITLED = "[untitled]".freeze

  scope :newest_first, -> { order(created_at: :desc) }

  define_method(:user) do
    uri = URI("http://konfamd.com/restful/customers/getcustomerbyid.json?id=#{user_id}")

    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
