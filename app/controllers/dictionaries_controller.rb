# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-

class DictionariesController < ApplicationController
  load_and_authorize_resource

  def index
    @dictionaries = Dictionary.order(:kind)
  end

  def update
    @dictionary = Dictionary.find(params[:id])

    if @dictionary.update_attributes(admin_params)
      flash[:success] = 'Zmiana przebiegła pomyślnie'
      redirect_to dictionaries_path
    else
      flash[:danger] = 'Podczas edycji występił błąd'
      redirect_to dictionaries_path
    end
  end

  def new
    @dictionary = Dictionary.new
  end

  def edit
    @dictionary = Dictionary.find(params[:id])
  end

  def create
    if Dictionary.create_with_parent(dictionary_params)
      flash[:success] = 'Dodano pozycję'
      redirect_to dictionaries_path
    else
      flash[:danger] = 'Podczas dodawania występił błąd'
      redirect_to new_dictionary_path
    end
  end

  def destroy
    @dictionary = Dictionary.find(params[:id])
    if @dictionary.destroy
      flash[:success] = 'Pomyślnie usunięto pozycję'
      redirect_to dictionary_index_path
    else
      flash[:danger] = 'Podczas usuwania występił błąd'
      redirect_to dictionary_index_path
    end
  end

  def dictionary_params
    params.require(:dictionaries).permit(:kind, :symbol, :ancestry, :parent_id)
  end
end
