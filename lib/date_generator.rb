module DateGenerator

    def date_generator
      date = Date.today
      string = date.strftime("%m%d%y")
    end

end
