class DateRange
  attr_reader :start_date, :end_date

  def initialize(start_date:, end_date:)
    @start_date, @end_date = start_date, end_date
  end

  def include_date?(date)
    date >= start_date && date <= end_date
  end

  def include_date_range?(date_range)
    start_date <= date_range.start_date && end_date >= date_range.end_date
  end

  def overlap_date_range?(date_range)
    start_date <= date_range.end_date && end_date >= date_range.start_date
  end

  def to_s
    "from #{start_date.strftime('%d-%B-%Y')} to #{end_date.strftime('%d-%B-%Y')}"
  end
end
