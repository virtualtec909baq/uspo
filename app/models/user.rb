class User < ActiveRecord::Base
   acts_as_token_authenticatable
  # Include default devise modules.
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
 
  # before_validation :set_provider
  # before_validation :set_uid
  after_initialize :skip_confirmed_at

  def skip_confirmed_at
      self.confirmed_at  ||= Time.now
  end
  
  # def set_provider
  #   puts self[:provider]
  #  self[:provider] = "email" if self[:provider].blank?
  # end
  
  def set_uid
    self[:uid] = self[:email] if self[:uid].blank? && self[:email].present?
  end
end
