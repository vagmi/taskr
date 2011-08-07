class Task < ActiveRecord::Base
  belongs_to :bucket
  has_many :taggables
  has_many :tags, :through=>:taggables
  #before_save :set_tags
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

  #def set_tags
    #puts 'set tags called'
    #pos = (self.title=~/#\w+/)
    #if(pos)
      #tags=self.title.scan(/#\w+/)
      #self.title=self.title.slice(0,pos-1)
      #tags.each do |t|
        #tag=Tag.find_by_name(t)
        #tag=Tag.new(:name=>t) unless tag
        #self.tags<<tag
      #end
    #end
  #end

  def title
    "#{super} #{self.tags.map(&:name).join(" ")}"
  end

  # faux accessor pattern
  def title=(value)
    pos = (value=~/#\w+/)
    if(pos)
      super(value.slice(0,pos-1))
      tags=value.scan(/#\w+/)
      tags.each do |t|
        tag=Tag.find_by_name(t)
        tag=Tag.new(:name=>t) unless tag
        self.tags<<tag
      end
    else
      super(value)
    end
  end
end
