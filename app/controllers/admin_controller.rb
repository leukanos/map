# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-

class AdminController < ApplicationController

  def index
    @dictionaries = Dictionary.order(:kind)
  end

  def update
    @dictionary = Dictionary.find(params[:id])

    if @dictionary.update_attributes(admin_params)
      flash[:success] = 'Zmiana przebiegła pomyślnie'
      redirect_to admin_index_path
    else
      flash[:danger] = 'Podczas edycji występił błąd'
      redirect_to admin_index_path
    end
  end

  def new
    @dictionary = Dictionary.new
  end

  def edit
    @dictionary = Dictionary.find(params[:id])
  end

  def create
    if Dictionary.create_with_parent(admin_params)
      flash[:success] = 'Dodano pozycję'
      redirect_to admin_index_path
    else
      flash[:danger] = 'Podczas dodawania występił błąd'
      redirect_to new_admin_path
    end
  end

  def destroy
    @dictionary = Dictionary.find(params[:id])
    if @dictionary.destroy
      flash[:success] = 'Pomyślnie usunięto pozycję'
      redirect_to admin_index_path
    else
      flash[:danger] = 'Podczas usuwania występił błąd'
      redirect_to admin_index_path
    end
  end

  def admin_params
    params.require(:dictionary).permit(:kind, :symbol, :ancestry, :parent_id)
  end
end
