class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :restaurants

  def full_name
    "#{first_name} #{last_name}"
  end

 
  def index
    @user = User.all
  end
  
  def new
    @picture = Picture.new
  end

  def edit
  end




  def show
    @user = User.find(params[:id])
  end
end



