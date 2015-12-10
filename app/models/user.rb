class User < ActiveRecord::Base
  has_many :empresas, dependent: :destroy
  attr_accessor :remember_token, :activation_token, :reset_token
  before_save   :downcase_email
  before_create :create_activation_digest
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = '1ekxCp5Qrd7hEdl9H1Danjcs'
      user.activated = true
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
  
  class << self
    # Retorna o hash digest da string dada. Para test
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
    
    # Retorna um token aleatorio.
    def new_token
      SecureRandom.urlsafe_base64
    end
  end
  
  # Lembra de um usuário no banco de dados para uso em sessões persistentes
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  # Retorna true se o token recebido bate com o digest(do banco)
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
  
  # Esquecer usuario.
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  # Ativa uma conta
  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  # Envia o email de ativaçao
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end
  
  # Defini os atributos quando a senha é resetada
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Envia o email de resetar senha
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end
  
  # Retorna verdadeiro caso tenha expirado o token de reset
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end
  
  private

    # Converte o email para minusculo
    def downcase_email
      self.email = email.downcase
    end

    # Cria e seta o token e digest do novo usuario
    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
    
end
