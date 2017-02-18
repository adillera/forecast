module TransactionsHelper
  def options_for_flow
    [
      ['Debit', 'debit'],
      ['Credit', 'credit']
    ]
  end

  def options_for_repeat
    [
      ['Single', 'single'],
      ['Semi-Monthly', 'semi-monthly'],
      ['Monthly', 'monthly'],
      ['Quarterly', 'quarterly'],
      ['Semi-Annual', 'semi-annual'],
      ['Annual', 'annual']
    ]
  end
end
