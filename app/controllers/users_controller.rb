class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  before_action :is_user_allowed

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Usuario", :users_path 

  def is_user_allowed
    if(current_user.isAdmin)
      return true
    end
    if(current_user.id.to_s == params[:id])
      return true
    end
    flash[:erro] = "Você não tem acesso a esse recurso"
    redirect_to root_path
  end

  # GET /user
  # GET /user.json
  def index
    @users = User.all
  end

  # GET /user/1
  # GET /user/1.json
  def show
  end

  # GET /user/new
  def new
    @user = User.new
  end

  # GET /user/1/edit
  def edit
  end

  # POST /user
  # POST /user.json
  def create

    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    @user = User.new(user_params)
    @user.password = "senha1234"

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Usuário criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user/1
  # PATCH/PUT /user/1.json
  def update

    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    Rails.logger.debug "#{user_params.inspect}"
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Usuário atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user/1
  # DELETE /user/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :gender, :name, :birth)
    end
end
