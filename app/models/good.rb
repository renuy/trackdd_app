class Good < ActiveRecord::Base
  belongs_to :book, :class_name => 'Book', :foreign_key => 'book_no'
  belongs_to :shipment
  attr_accessible :book_no, :action, :state  
  validates :book_no, :presence => true, :uniqueness => {:scope => :shipment_id}, :length => { :maximum => 30 }
  validate :book_exists

  def book_exists
    
    book = Book.find(self.book_no)
    if book.nil?
	    errors.add(:book_no, ' does not exists')
    end
    rescue ActiveRecord::RecordNotFound
      errors.add(:book_no, ' does not exists')
  end
end
