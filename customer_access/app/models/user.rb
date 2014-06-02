#encoding: utf-8
class User < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => {:case_sensitive => false}
  validates :password, :presence => true
  validates :password_confirmation, :presence => true
  validates :forget_password_question, :presence => true
  validates :question_answer, :presence => true

  has_secure_password
  attr_accessible :name, :password, :password_confirmation, :forget_password_question, :question_answer, :token
  before_create { generate_token(:token) }

  def generate_token(column)
    begin
      self[column]=SecureRandom.urlsafe_base64
    end while User.exists?(column=>self[column])
  end


  #def user_params
  #  params.require(:user).permit(:name, :password, :password_confirmation, :forget_password_question, :question_answer, :token)
  #end


end

