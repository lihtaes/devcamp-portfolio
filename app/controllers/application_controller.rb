class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SetSource
#include CurrentUserConcern
  include DefaultPageContent
<<<<<<< HEAD

=======
>>>>>>> 2f4daa4bfd0e4db31e358b4ee831bcd4c17269b5





  def current_user
    super || OpenStruct.new(name:"Guest User", first_name: "Guest", last_name: "User", email:"guest@example.com")
  end

end
