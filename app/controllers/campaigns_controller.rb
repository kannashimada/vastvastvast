# キャンペーン用コントローラ
class CampaignsController < ApplicationController

  before_action :set_campaign, only: [:edit, :update, :destroy]

  # 一覧表示
  def index
    unless params[:cuepoint_id]
      @campaigns = Campaign.all
    else
      # 下記はVAST URL呼び出しを想定
      @cuepoint = Cuepoint.find(params[:cuepoint_id])
      @campaigns = Campaign.current_available(@cuepoint)
      response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || '*'
      response.headers['Access-Control-Allow-Methods'] = 'GET'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Credentials'] = 'true'
      headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type'
    end
  end

  # 新規
  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    if @campaign.save
      flash[:success] = "Create Campaign"
      redirect_to campaigns_url
    else
      flash.now[:danger] = "Invalid Values"
      render :new
    end
  end

 def edit
 end

 def update
    if @campaign.update(campaign_params)
      CampaignCuepoint.find_or_create_by(campaign_id: params[:id])
      flash[:success] = "キャンペーンを登録しました"
      redirect_to campaigns_url
    else
      flash.now[:danger] = "Invalid Values"
      render :edit
    end
 end

 def destroy
    @campaign.destroy
    flash[:success] = 'キャンペーンを削除しました'
    redirect_to campaign_url
 end

  private
# キャンペーン用パラメータ
  def set_campaign
     @campaign = Campaign.find(params[:id])
  end
  
  def campaign_params
    params.require(:campaign).permit(:name, :start_at, :end_at, :limit_start, :movie_url, cuepoint_ids: [])
  end
  

end