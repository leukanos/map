# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-


class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    @user.id = User.unscoped.order(:id).last.id + 1
    if @user.save
      flash[:success] = 'Utworzono uzytkownika'
      redirect_to :back
    else
      render 'new'
    end
  end
  
  def index
    @users = User.order(:email).paginate(page: params[:page])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])

    if @user.update_without_password(user_params)
      flash[:success] = 'Pomyślnie zmieniono użytkownika'
      redirect_to users_url
    else
      flash[:danger] = 'Wystąpił błąd podczas zapisywania'
      render 'edit'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def destroy
    if current_user == User.find(params[:id])
      flash[:warning] = 'Nie możesz usunąć sam siebie'
      redirect_to users_url
    elsif User.find(params[:id]).destroy
      flash[:success] = 'Pomyślnie usunięto użytkownika'
      redirect_to users_url
    else
      flash[:danger] = 'Podczas usuwania występił błąd'
      redirect to users_url
    end
  end

  def user_params
    # It's mandatory to specify the nested attributes that should be whitelisted.
    # If you use `permit` with just the key that points to the nested attributes hash,
    # it will return an empty hash.
    params.require(:user).permit(:firstname, :lastname, :email, :tel, :password, :password_confirmation, :limit, roles: [])
  end
end
