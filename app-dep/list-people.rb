class ListPeople
    def initialize(everyone)
      @everyone = everyone
    end
  
    def list_people
      if @everyone.length.positive?
        listing(@everyone)
      else
        puts 'No people added yet!'
      end
    end
  end