#encoding: utf-8
class User < ActiveRecord::Base
  has_secure_password
  before_create { generate_token(:token) }

  validates :uer_name, :presence => true, :uniqueness => {:case_sensitive => false}
  validates :forget_password_question, :presence => true
  validates :question_answer, :presence => true

  def user_params
    params.require(:user).permit(:user_name, :password, :password_confirmation, :forget_password_question, :question_answer,:token)
  end

  def generate_token(column)
    begin
      self[column]=SecureRandom.urlsave_base64
    end while User.exists?(column => self[column])
  end
end



