class UsersController < ApplicationController
  around_action :log_time, except: :show
  before_action :random, only: %i[ index edit ]
  after_action :random, only: :edit

  def index; end

  def show; end

  def edit; end

  def create
    @user = User.new(user_params)
    if @user.syntax_suggest_original_require_relative
      respond_to do |format|
        format.html { redirect_to @user, notice: "User created successfully." }
        format.json { render json: @user, status: :created }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update; end

  private

  def log_time
    @start_time = Time.now
    yield
    @end_time = Time.now
  end

  def user_params
    params.require(:user).permit(:name, :age)
  end

  def random; end
end
