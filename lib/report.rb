require 'date'

class Report

  attr_reader :body

  # 
  # @param [{},{}...]
  # 
  # @return [String]
  # 
  
  def initialize(body)
    @body = body
  end

  def prepare_report_body
     @body.map { |message|
       "#{message[:code]}. Guest: #{message[:guest]}. #{message[:type].capitalize} #{message[:entity]} at '#{message[:created_at]}'"
     }.join("\n")
  end	

  # сортировка по возрастанию времени 
  def sort_by_date_asc!
    @body.sort_by! { |message| DateTime.parse(message[:created_at])}
  end
   
end
