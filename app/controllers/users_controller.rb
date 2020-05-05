class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(name: params["name"], password: params["password"])

    if @user.save
      render json: @user
    else
      render status: 409, json: { status: 409, message: 'Conflict' }
    end
  end

  #POST /user/login userが存在する場合、トークンを返す
  def login
    @user = User.find_by(name: params["name"], password: params["password"])
    if @user != nil
      render json: @user
    else
      render status: 401
    end
  end



  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:id, :name, :password)
    end
end
