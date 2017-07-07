# キューポイントクラス
class Cuepoint < ApplicationRecord
  has_many :campaign_cuepoints
  has_many :results
  
 has_and_belongs_to_many :campaigns
  
 has_many :cues , through: :campaign_cuepoints, source: :cuepoint
end