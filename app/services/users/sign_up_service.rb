class Users::SignUpService
  include BCrypt
  
  def initialize(params)
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @email = params[:email]
    @password = params[:password]
    @password_confirmation = params[:password_confirmation]
  end

  def perform
    check_user_email
    check_password_confirmation
    create_user
    check_user_validation
  end

  private

  def check_user_email
    user_email = User.find_by(email: @email)
    if user_email.present?
      raise ServiceError, "This email`s already taken"
    end
  end

  def check_password_confirmation
    if @password != @password_confirmation
      raise ServiceError, "The password doesn`t match"
    end
  end

  def create_user
    @user = User.create(
      first_name: @first_name,
      last_name: @last_name,
      email: @email,
      password: @password.present? ? Password.create(@password) : nil
    )
  end

  def check_user_validation
    raise ServiceError, @user.errors.full_messages unless @user.valid?
  end
end