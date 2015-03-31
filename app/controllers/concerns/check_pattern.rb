module CheckPattern
  extend ActiveSupport::Concern
  
  def format_pattern(data)
    @notam_hash = {}
    match = ''
    count = 0
    wday = { "MON" => 1, "TUE" => 2, "WED" => 3,
      "THU" => 4, "FRI" => 5, "SAT" => 6, "SUN" => 7 }  ### this can put in lib constant file
    data.split(/ EUECYIYN/).each do |str|
      str.match(/.*A\) (\w+)/)
      match = $1
      txt = substring_between(str, "ERODROME HOURS OF OPS/SERVICE", "CREATED")
      if txt.nil?
        flash[:notice] = "No Word found to Parse"
      else
        begin
          val = txt.gsub(/^\./, "").lstrip.chop
          @arr_times = {}
          notam_arr = []
          val.scan(/(\S+) (\d+-\d+(,\d+-\d+)*|\w+)/).each { |days, times|
            day1, day2  = days.split '-'
            ndays = (wday[day2] || wday[day1]) - wday[day1]
            (ndays + 1).times { notam_arr << times}
          }
          @arr_times[match] = notam_arr
          @notam_hash.merge!(count => @arr_times)
          count += 1
        rescue
          flash[:notice] = "No Word found to Parse"
        end
      end
    end  
  end

  def substring_between(target, match1, match2)
    start_match1 = target.index(match1)
    if start_match1 && start_match2 = target.index(match2, start_match1 + match1.length)
      start_idx = start_match1 + match1.length
      target[start_idx, start_match2 - start_idx]
    else
      nil
    end
  end
end
