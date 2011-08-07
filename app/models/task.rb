class Task < ActiveRecord::Base
  belongs_to :bucket
  has_many :taggables
  has_many :tags, :through=>:taggables
  def complete!
    self.done=true
    self.save!
  end
  def to_hashtags
    self.tags.map(&:name).map { |t| "##{t}" }.join(' ')
  end
  def display
    "#{self.title} #{to_hashtags}"
  end
end
