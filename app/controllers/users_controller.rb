class UsersController < ApplicationController

  load_and_authorize_resource instance_name: "record"

  def pwd; end

  def index
    @records = User.where(condition(User)).order(updated_at: :desc).page params[:page]
  end

  def new; end
  def create
    @record = User.new(record_params)
    flash[:notice] = "user was successfully created" if @record.save
    respond_with(@record, location: users_path)
  end

  def show; end

  def edit; end
  def update
    flash[:notice] = "user was successfully updated" if @record.update(record_params)
    respond_with(@record, location: users_path)
  end

  def destroy
    flash[:notice] = "user was successfully destroyed" if @record.destroy
    respond_with(@record, location: users_path)
  end

  private
  def set_record
    @record = params[:id] ? User.find(params[:id]) : User.new
  end
  def record_params
    if params.require(:r).include? :password and action_name.to_sym == :update
      params.require(:r).permit(:password)
    else
      params.require(:r).permit(User.attribute_names + [:password])
    end
  end

end
