class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :omniauthable, :omniauth_providers => [:github], :authentication_keys => [:login]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :password, :password_confirmation, :remember_me, :provider, :uid, :login, :encrypted_password
  attr_accessor :login

  has_many :links
  has_many :votes
  has_many :comments
  has_many :tags
  has_many :languages
  has_many :categories

  validates :username,
    :presence => true,
    :uniqueness => {:case_sensitive => false},
    :length => {:minimum => 1, :maximum => 254}

  def email_required?
    false
  end

  def add_github_login(auth)
    self.github_id = auth['uid']
    self.github_username = auth['info']['nickname']
    self.github_email = auth['info']['email']
  end

  def self.assign_username(username)
    if User.where(:username => username).exists?
      username = username + '1'
    end
    username
  end

  def self.github_find_or_create(auth)
    unless user = User.find_by_github_id(auth['uid'])
      user = create! do |u|
        u.github_id = auth['uid']
        u.github_username = auth['info']['nickname']
        u.username = assign_username(auth['info']['nickname'])
        u.github_email = auth['info']['email']
        u.password = SecureRandom.hex(6)
      end
    end
    return user
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def require_password?
    self.crypted_password && self.crypted_password_changed?
  end

end