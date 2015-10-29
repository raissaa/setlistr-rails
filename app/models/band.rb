class Band < ActiveRecord::Base
  has_many :contracts
  has_many :members, :class_name => "User", :through => :contracts, :source => :user
  has_one :setlist
  
  validates :name, presence: true
  
  before_create do
    self.setlist = Setlist.create
  end
  
  accepts_nested_attributes_for :contracts
  
  def contract_attributes=(contract_attributes)
    contract_attributes.each do |attributes|
      contracts.build(attributes)
    end
  end
  
  def active_members
    self.members.where(:contracts=> {:approved => true})
  end
  
  def invite_token
    hashids = Hashids.new Rails.application.config.invite_salt
    
    hashids.encode(self.id)
  end
  
  def self.from_invite_token(token)
    hashids = Hashids.new Rails.application.config.invite_salt
    
    Band.find(hashids.decode(token).first)
  end
end
