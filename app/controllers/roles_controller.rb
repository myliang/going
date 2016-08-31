class RolesController < ApplicationController

  load_and_authorize_resource instance_name: "record"

  def index
    @records = Role.where(condition(Role)).order(updated_at: :desc).page params[:page]
  end

  def new; end
  def create
    @record = Role.new(record_params)
    flash[:notice] = "role was successfully created" if @record.save
    respond_with(@record, location: roles_path)
  end

  def show; end

  def edit; end
  def update
    flash[:notice] = "role was successfully updated" if @record.update(record_params)
    respond_with(@record, location: roles_path)
  end

  def destroy
    flash[:notice] = "role was successfully destroyed" if @record.destroy
    respond_with(@record, location: roles_path)
  end

  private
  def record_params
    permitted = params.require(:r).permit(Role.attribute_names)
    rule = {}
    params[:rule] and params[:rule].each do |e|
      a = e.split(',')
      rule[a[0]] = [] unless rule.include? a[0]
      rule[a[0]] << a[1]
    end
    permitted[:rule] = rule
    permitted
  end

end
