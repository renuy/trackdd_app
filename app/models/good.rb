class Good < ActiveRecord::Base
  include ActiveRecord::Transitions
  belongs_to :book, :class_name => 'Book', :foreign_key => 'book_no'
  belongs_to :shipment
  attr_accessible :book_no, :action, :state, :book_no_str
  attr_accessor :title, :event
  validates :book_no, :presence => true, :uniqueness => {:scope => :shipment_id}, :length => { :maximum => 30 }
  validate :book_exists

  state_machine do
  	state :New # first one is the initial state
    state :Confirmed

		event :confirm do
			transitions :to => :Confirmed, :from => :new
		end
	end 
  
  def book_exists
    book = Book.find(self.book_no)
    if book.nil?
	    errors.add(:book_no, ' does not exists')
    end
    rescue ActiveRecord::RecordNotFound
      errors.add(:book_no, ' does not exists')
  end
  
  def book_title
    book = Book.find(self.book_no)
    Title.find(book.title_id).title
  end
  
  def curr_state
    cstate = ''
    case 
      when  self.state.eql?('New')
        cstate = 'pending'
      when  self.state.eql?('Confirmed')
        cstate = 'confirmed'
    end
    
    return cstate
  end
end
