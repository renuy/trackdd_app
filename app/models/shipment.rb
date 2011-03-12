class Shipment < ActiveRecord::Base
	include ActiveRecord::Transitions
  ACTION = {
    :Exchange   => 'Exchange',
    :Deliver  => 'Deliver', 
    :Pickup   => 'Pickup'
  }  
  
  has_many :goods, :dependent => :destroy
	accepts_nested_attributes_for :goods, :allow_destroy => :true, :reject_if => lambda { |a| a[:book_no].blank? }
  belongs_to :member, :class_name => 'Membership', :foreign_key => 'membership_id'
  belongs_to :origin, :class_name => 'Branch', :foreign_key => 'origin_id'
  attr_accessible :origin_id, :destination, :goods_attributes, :special_instr, :action, :card_id
  validate :card_exists

  before_save :set_member
  validates :card_id, :presence => true, :length => { :maximum => 30 }
  validates :destination, :presence => true, :length => { :maximum => 500 }
  validate :card_exists
	state_machine do
  	state :New # first one is the initial state
  	state :Initiated
  	state :Confirmed
  	state :Cancelled

		event :initiate do
			transitions :to => :Initiated, :from => :New
		end
		event :confirm do
			transitions :to => :Confirmed, :from => :Initiated
		end
		event :cancel do
			transitions :to => :Cancelled, :from => [:New, :Initiated]
		end
	end 
  def set_member
    member = Membership.find_by_card_id(self.card_id)
    self.membership_id = member.id
  end
  def card_exists
    member = Membership.find_by_card_id(self.card_id)
    if member.nil?
	    errors.add(:card_id, ' does not exists')
    end

  end

end
