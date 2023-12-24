module ApplicationHelper
    def first_word_of_username
        current_user.first_name.split("").first if user_signed_in?
      end
end
