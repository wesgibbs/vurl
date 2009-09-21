xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
xml.chart do
  # xml.message "You can broadcast any message to chart from data XML file", :bg_color => "#FFFFFF", :text_color => "#000000"
  xml.series do
    @days.each_with_index do |day, index|
      xml.value day.name, :xid => index
    end
  end

  xml.graphs do
   #the gid is used in the settings file to set different settings just for this graph
    xml.graph :gid => 'hits_by_day' do
      @days.each_with_index do |day, index|
        hits_by_day = @vurl.clicks.by_day(day)
        xml.value value, :xid => index, :color => "#00C3C6", :gradient_fill_colors => "#009c9d,#00C3C6", :description => level
      end
    end
  end
end
