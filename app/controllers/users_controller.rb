class UsersController < ApplicationController
  layout 'vurls'

  def claim
    if @user = User.find_by_claim_code(params[:claim_code])
      render :action => 'edit'
    else
      flash[:error] = "Sorry, we couldn't find that claim code. Contact Veez if you feel this is an error."
      redirect_to root_path
    end
  end

  def edit
    unless @user = User.find(params[:id])
      flash[:error] = "Sorry, we couldn't find that user. Contact Veez if you feel this is an error."
      redirect_to root_path
    end
  end

  def update
    if @user = User.find(params[:id])
      if @user.update_attributes(params[:user])
        @user.claim! if @user.unclaimed?
        flash[:success] = "Successfully updated your profile"
        redirect_to root_path
      else
        flash[:error] = "There was an error saving your profile."
        render :action => 'edit'
      end
    else
      flash[:error] = "There was an error saving your profile."
      render :action => 'edit'
    end
  end
end
