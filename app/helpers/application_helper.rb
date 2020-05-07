module ApplicationHelper

  # .roundで小数第一位を四捨五入。さらにinteger型に変換。
  # .to_s(:delimited)で3桁のカンマ区切り。
  def money_notation(price)
    price.round.to_s(:delimited)
  end

  #値がintegerに変更可能かの確認
  def integer_string?(str)
    Integer(str)
      true
    rescue ArgumentError
      false
  end

end
