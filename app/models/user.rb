class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def isAdmin
  	if self.email == "kleberpinel@gmail.com"
  		return true
  	end
  	return false
  end
   
end
