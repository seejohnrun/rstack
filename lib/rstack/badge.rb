module RStack

  class Badge

    ATTRS = [:badge_id, :rank, :name, :description, :award_count, :tag_based, :badges_recipients_url]
    
    attr_reader *ATTRS
    
    def initialize(b)
      b.each { |k, v| self.send("#{k}=", v) }
    end

    private

    attr_writer *ATTRS
    
  end
  
end
