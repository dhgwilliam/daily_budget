class Month
  def self.day
    Time.now.day
  end

  def self.this_month
    Time.now.month
  end

  def self.days(month)
    self.calendar[month - 1]
  end

  def self.days_left
    self.days(self.this_month) - self.day
  end

  private

  def self.calendar
    [31, 28, 31, 30, 30, 31, 31, 30, 31, 30, 31]
  end
end
