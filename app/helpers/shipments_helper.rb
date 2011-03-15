module ShipmentsHelper
  def report_msg(create, start_d_s, end_d_s)
    mesg = ""
    if (!start_d_s.nil?)
      start_s = start_d_s["start(3i)"] + '-' + start_d_s["start(2i)"] +'-'+ start_d_s["start(1i)"]
    end
    if (!end_d_s.nil?)
      end_s = end_d_s["end(3i)"] + '-' + end_d_s["end(2i)"] +'-'+ end_d_s["end(1i)"]
    end
    case
    when create.eql?("All") then mesg = " till now "
    when create.eql?("On") then mesg = " raised on "+start_s
    when create.eql?("Today") then mesg = "raised today"
    when create.eql?("Range") then mesg = "raised between "+ start_s+" and "+end_s
    end
  end
end
