class Bill < ApplicationRecord
  after_initialize :default_values

  scope :for_month, ->(user_id,month, year) {
    where('user_id = ? AND extract(month  from date_record) = ? AND extract(year  from date_record) = ?',
          user_id,month, year)
  }

  scope :with_input, ->(user_id,month, year) {
    where('user_id = ? AND input > 0 AND extract(month  from date_record) = ? AND extract(year  from date_record) = ?',
          user_id,month, year)
  }

  scope :with_output, ->(user_id,month, year) {
    where('user_id = ? AND output > 0 AND extract(month  from date_record) = ? AND extract(year  from date_record) = ?',
          user_id,month, year)
  }


  belongs_to :user

  validates_presence_of :title
  validates_presence_of :date_record

  def date_record
    unless attributes['date_record'].blank?
      return  attributes['date_record'].strftime("%d/%m/%Y")
    end
    return nil
  end


  def self.search(user, title, input_min, input_max,
                  output_min, output_max, date_min, date_max)
    @all = self.all

    @all = @all.where(user: user)
    unless title.blank?
      @all = @all.where("lower(title) iLIKE ?", "%"+title.downcase+"%")
    end

    if !input_min.blank? && !input_max.blank?
      @all = @all.where("input BETWEEN ? AND ?", currency_to_number(input_min),
                        currency_to_number(input_max))
    elsif !input_max.blank?
      @all = @all.where('input <= ?', currency_to_number(input_max))
    elsif !input_min.blank?
      @all = @all.where("input >= ?", currency_to_number(input_min))
    end

    if !output_min.blank? && !output_max.blank?
      @all = @all.where("output BETWEEN ? AND ?", currency_to_number(output_min),
                        currency_to_number(output_max))
    elsif !output_max.blank?
      @all = @all.where('output <= ?', currency_to_number(output_max))
    elsif !output_min.blank?
      @all = @all.where("output >= ?", currency_to_number(output_min))
    end

    if !date_max.blank? && !date_min.blank?
      @all = @all.where("date_record BETWEEN ? AND ?", convert_to_date(date_min),
                        convert_to_date(date_max))
    elsif !date_max.blank?
      @all = @all.where('date_record <= ?', date_max)
    elsif !date_min.blank?
      @all = @all.where("date_record >= ?", date_min)
    end
    @all
  end


  private

  def self.currency_to_number(currency_value)
    (currency_value.is_a? String) ? currency_value.scan(/[.0-9]/).join.to_d : currency_value
  end

  def self.convert_to_date(value)
    date = DateTime.parse(value)
  end

  def default_values
    self.output ||= 0.00
    self.input ||= 0.00
  end
end
