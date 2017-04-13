class Bill < ApplicationRecord

  belongs_to :user

  validates_presence_of :title
  validates_presence_of :date_input


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
      @all = @all.where("date_input BETWEEN ? AND ?", date_min, date_max)
    elsif !date_max.blank?
      @all = @all.where('date_input <= ?', date_max)
    elsif !date_min.blank?
      @all = @all.where("date_input >= ?", date_min)
    end
    @all
  end


  private
  def self.currency_to_number(currency_value)
    (currency_value.is_a? String) ? currency_value.scan(/[.0-9]/).join.to_d : currency_value
  end
end
