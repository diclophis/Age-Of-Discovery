module Aod
  module Models
    class Hero
      #< Neo4j::Rails::Model
      include ActiveGraph::Node
      #include Neo4j::ActiveNode

      # Neo4j.rb needs to have property definitions before any validations. So, the property block needs to come before 
      # loading your devise modules. 
      #
      # If you add another devise module (such as :lockable, :confirmable, or :token_authenticatable), but sure to 
      # uncomment the property definitions for those modules. Otherwise, the unused property definitions can be deleted. 
      #
      # Setup accessible attributes for your model
      #attr_accessible :email, :password, :password_confirmation, :remember_me

      property :username, :type =>   String
      #property :facebook_token, :type => String, :index => :exact

      property :created_at, :type => Time
      property :updated_at, :type => Time

      ## Database authenticatable
      property :email #, :type => String, :null => false, :default => "", :index => :exact
      property :password
      #property :encrypted_password, :type =>  NilClass

      ## If you include devise modules, uncomment the properties below.

      ## Rememberable
      property :remember_created_at, :type => Time
      #index :remember_token, :type => :exact

      ## Recoverable
      #property :reset_password_token,   :type => NilClass, :index => :exact
      property :reset_password_sent_at, :type =>   Time

      ## Trackable
      property :sign_in_count, :type => Integer, :default => 0
      property :current_sign_in_at, :type => Time
      property :last_sign_in_at, :type => Time
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
      #devise :database_authenticatable, :registerable,
      #       :recoverable, :rememberable, :trackable, :validatable

      property :fame, :type => Integer, :default => 0

      #has_n :gold_transactions
      #http://neo4j.rubyforge.org/guides/rules_and_functions.html

      #has_n(:converted_gold).to(Voucher)
      has_many :in, :converted_gold, :type => :voucher, :model_class => "Aod::Models::Voucher"

      ##has_list :converted_gold

      has_one :in, :rank, :type => :rank, :model_class => "Aod::Models::Rank"

      before_create :grant_initial_gold_voucher

      validates :email, { presence: true }
      validates_uniqueness_of :email

    #def converted_gold
    #  vouchers
    #end

    private

      def grant_initial_gold_voucher
        converted_gold << Aod::Models::Voucher.new(:worth => 0)
      end
    end
  end
end
