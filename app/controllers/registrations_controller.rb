class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    if params['developer'] == 'true'
      @user = User.new(sign_up_params)
      @user.developer = true
      @user.employer = false
    else
      @user = User.new(sign_up_params)
      @user.developer = false
      @user.employer = true
    end

    if @user.save
      sign_in(@user)
      # flash[:success] = "Welcome, #{@user.name}! You're a part of the Hiresly family now."
      # flash.keep(:notice)
      redirect_to root_path
    else
      # flash[:danger] = "There was some error with your login!"
      render :new
    end
  end

  def update
    super
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
  end
end
