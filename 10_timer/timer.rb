class Timer

  attr_reader :seconds
  attr_reader :time_string

  def initialize
    @seconds = 0
    @time_string = get_time_string(@seconds)
  end

  def seconds=(seconds)
    @seconds = seconds
    @time_string = get_time_string(@seconds)
  end

  private

    def padding(number)
      if number < 9
        "0" + number.to_s
      else
        number.to_s
      end
    end

    def get_time_string(seconds)
      return "00:00:00" if seconds.class != Fixnum
      if seconds <= 0
        "00:00:00"
      elsif seconds <= 9
        "00:00:" + padding(seconds)
      elsif seconds <= 60
        "00:00:" + seconds.to_s
      elsif seconds <= 3600
        minutes = seconds / 60
        seconds = seconds % 60
        "00:" + padding(minutes) + ":" + padding(seconds)
      elsif seconds <= 3600*60
        hours = seconds / 3600
        minutes = (seconds % 3600) / 60
        seconds = seconds % 60
        padding(hours) + ":" + padding(minutes) + ":" + padding(seconds)
      end
    end
end