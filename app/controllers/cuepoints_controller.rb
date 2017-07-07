# Cue Point コントローラ
class CuepointsController < ApplicationController
before_action :set_cuepoint, only: [:edit, :update, :destroy]
  
  def index
    @cuepoints = Cuepoint.all
  end
  
  def new
    @cuepoint = Cuepoint.new
  end
  
 def create
    @cuepoint = Cuepoint.new(cuepoint_params)
    if @cuepoint.save
      flash[:success] = "キューポイントを登録しました"
      redirect_to cuepoints_url
    else
      flash.now[:danger] = "Invalid Values"
      render :new
    end
 end
  
 def edit
 end
  
 def update
    if @cuepoint.update(cuepoint_params)
      flash[:success] = "キューポイントを登録しました"
      redirect_to cuepoints_url
    else
      flash.now[:danger] = "Invalid Values"
      render :edit
    end
 end
  
 def destroy
    @cuepoint.destroy
    flash[:success] = 'キューポイントを削除しました'
    redirect_to cuepoints_url
 end
  
 private
  
 def set_cuepoint
     @cuepoint = Cuepoint.find(params[:id])
 end
  
 def cuepoint_params
    params.require(:cuepoint).permit(:name)
 end
end