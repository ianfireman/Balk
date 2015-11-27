class User < ActiveRecord::Base
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
  
  def right_url(wrong_link)
    urlStr = wrong_link
    urlStr = urlStr[24..-1]
    urlStr = "https://floating-plains-2613" + urlStr
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
