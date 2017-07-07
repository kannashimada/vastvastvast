class CampaignCuepoint < ApplicationRecord
  belongs_to :campaign
  belongs_to :cuepoint
end