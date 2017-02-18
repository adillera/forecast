class Cassandra
  attr_reader :user, :start_date, :end_date

  def initialize(user, args)
    @user = user
    @my_money = user.initial_amount
    @start_date = Date.parse(args[:start_date])
    @end_date = Date.parse(args[:end_date])
  end

  def predict
    date_range.inject([]) do |ini, date|
      start_of_month = date.beginning_of_month
      end_of_month = date.end_of_month
      quarter = (date.beginning_of_year + 3.months).end_of_month
      half_of_year = (date.beginning_of_year + 5.months).end_of_month

      remove_monies(single_occurrence: date)

      case
      when date == start_of_month + 14.days
        remove_monies(repeat: 'semi-monthly')
      when date == end_of_month
        # Because the end of month is also the second half of the semi-monthly
        remove_monies(repeat: 'semi-monthly')

        remove_monies(repeat: 'monthly')
      when date == quarter
        remove_monies(repeat: 'quarterly')
      when date == half_of_year
        remove_monies(repeat: 'semi-annual')
      when date == date.end_of_year
        # Because the end of year is also the second half of the semi-annual
        remove_monies(repeat: 'semi-annual')

        remove_monies(repeat: 'annual')
      end

      key = date.strftime('%d %B, %Y')

      ini << { "#{ key }" => @my_money }
    end
  end

  private
  def date_range
    (start_date..end_date).to_a
  end

  def remove_monies(query)
    transactions = user.transactions.where(query)

    transactions.each do |t|
      if t.flow == 'credit'
        @my_money += t.amount
      else
        @my_money -= t.amount
      end
    end
  end
end
