class Hero < Neo4j::Rails::Model
  include Neo4j::ActiveNode
  # Neo4j.rb needs to have property definitions before any validations. So, the property block needs to come before 
  # loading your devise modules. 
  #
  # If you add another devise module (such as :lockable, :confirmable, or :token_authenticatable), but sure to 
  # uncomment the property definitions for those modules. Otherwise, the unused property definitions can be deleted. 
  #
  # Setup accessible attributes for your model
  #attr_accessible :email, :password, :password_confirmation, :remember_me

  property :username, :type =>   String
  property :facebook_token, :type => String, :index => :exact

  property :created_at, :type => DateTime
  property :updated_at, :type => DateTime

  ## Database authenticatable
  property :email, :type => String, :null => false, :default => "", :index => :exact
  property :encrypted_password, :type =>  String #NilClass

  ## If you include devise modules, uncomment the properties below.

  ## Rememberable
  property :remember_created_at, :type => DateTime
  
  #index :remember_token, :type => :exact

  ## Recoverable
  property :reset_password_token,   :type => String, :index => :exact
  property :reset_password_sent_at, :type =>   DateTime

  ## Trackable
  property :sign_in_count, :type => Float, :default => 0
  property :current_sign_in_at, :type => DateTime
  property :last_sign_in_at, :type => DateTime
  property :current_sign_in_ip, :type =>  String
  property :last_sign_in_ip, :type => String

  ## Confirmable
  # property :confirmation_token, :type => NilClass, :index => :exact
  # property :confirmed_at, :type => DateTime
  # property :confirmation_sent_at, :type => DateTime

  ## Lockable
  # property :failed_attempts, :type => Fixnum, :default => 0
  # property :locked_at, :type => DateTime
  # property :unlock_token, :type => String, :index => :exact

  ## Token authenticatable
  # property :authentication_token, :type => String, :null => true, :index => :exact

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  property :fame, :type => Float, :default => 0.0

  #has_n :gold_transactions
  #http://neo4j.rubyforge.org/guides/rules_and_functions.html

  has_n(:converted_gold).to(Voucher)
  #has_list :converted_gold

  has_one(:rank).to(Rank)

  before_create :grant_initial_gold_voucher

  def assign_attributes(a, b)
    super(a)
  end

  def initialize(attributes = nil, options = {})
    super(attributes)
  end

private

  def grant_initial_gold_voucher
    v = Voucher.new(:worth => 0.0)
    v.save!
    converted_gold << v
  end
end
