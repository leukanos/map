# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-


class UsersController < ApplicationController
  load_and_authorize_resource
  before_filter :set_user, only: [:edit, :update, :show, :destroy]

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    @user.id = User.unscoped.order(:id).last.id + 1
    if @user.save
      gflash success: t('users.user_created')
      redirect_to :back
    else
      render 'new'
    end
  end
  
  def index
    @users = User.order(:email).paginate(page: params[:page])
  end
  
  def edit
  end
  
  def update

    if @user.update_without_password(user_params)
      gflash success: t('users.user_updated')
      redirect_to users_url
    else
      render 'edit'
    end
  end
  
  def show
  end
  
  def destroy
    if current_user == @user
      gflash warning: t('users.cannot_remove_yourself')
      redirect_to users_url
    elsif User.find(params[:id]).destroy
      gflash success: t('users.user_destroyed')
      redirect_to users_url
    else
      redirect_to users_url
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :tel, :password, :password_confirmation, :limit,
                                 roles: [], project_ids: [])
  end
end
