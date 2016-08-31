class MyController < ApplicationController
  def pwd
    if request.request_method_symbol == :put
      # 更新密码
      begin
        raise Exception.new("old password is empty!") if params[:old_password].blank?
        raise Exception.new("confirm password is empty!") if params[:confirm_password].blank?
        raise Exception.new("new password is empty!") if params[:new_password].blank?
        raise Exception.new("new password is not equal confirm password") if params[:new_password] != params[:confirm_password]
        raise Exception.new("old password error!") unless current_user.valid_password?(params[:old_password])
        current_user.update!(password: params[:new_password])
        flash.now[:notice] = "user's password was successfully updated"
      rescue Exception => e
        flash.now[:error] = e.message
      end
    end

  end
end
