class Card < ActiveRecord::Base
    validates :original_text, :translated_text, :review_date, presence: true
    validate :compare
    before_validation :set_date
    
protected
    def set_date
        self.review_date ||= Time.now.to_date+3
    end    
    
   def compare
        errors.add(:original_text, "Equal text") if self.original_text.mb_chars.downcase.to_s == self.translated_text.mb_chars.downcase.to_s
   end
end
