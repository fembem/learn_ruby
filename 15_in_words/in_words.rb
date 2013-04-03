
module InWords

  ONE_THOUSAND = 1000
  ONE_MILLION = ONE_THOUSAND*ONE_THOUSAND
  ONE_BILLION = ONE_THOUSAND * ONE_MILLION
  ONE_TRILLION = ONE_THOUSAND * ONE_BILLION
  ONE_THOUSAND_TRILLION = ONE_THOUSAND * ONE_TRILLION

  def in_words
    if self < ONE_TRILLION
      in_words_less_than_a_trillion
    elsif self < ONE_THOUSAND_TRILLION
      (self / (ONE_TRILLION)).in_words_less_than_1000 + " trillion" +
          ((self%(ONE_TRILLION)==0) ? "" : " " + (self%(ONE_TRILLION)).in_words_less_than_a_trillion)
    end
  end

  def in_words_less_than_a_trillion
    if self < ONE_BILLION
      in_words_less_than_a_billion
    elsif self < ONE_TRILLION
      (self / ONE_BILLION).in_words_less_than_1000 + " billion" +
          ((self%ONE_BILLION==0) ? "" : " " + (self%ONE_BILLION).in_words_less_than_a_billion)
    end
  end

  def in_words_less_than_a_billion
    if self < ONE_MILLION
      in_words_less_than_a_million
    elsif self < ONE_BILLION
      (self / ONE_MILLION).in_words_less_than_1000 + " million" +
          ((self%ONE_MILLION==0) ? "" : " " + (self%ONE_MILLION).in_words_less_than_a_million)
    end
  end

  def in_words_less_than_a_million
    if self < 1000
      in_words_less_than_1000
    elsif self < 1000 * 1000
      (self / 1000).in_words_less_than_1000 + " thousand" +
          ((self%1000==0) ? "" : " " + (self%1000).in_words_less_than_1000)
    end
  end

  def in_words_less_than_1000
    if self < 100
      in_words_less_than_100
    elsif self < 1000
      hundreds_number(self / 100) + ((self%100==0) ? "" : " " + (self%100).in_words_less_than_100)
    end
  end

  def hundreds_number(num_hundreds)
    singles[num_hundreds.to_s] + " hundred"
  end

  #def thousands_number(num_thousands)
  #  singles[num_thousands.to_s] + " thousand"
  #end

  #def millions_number(num_millions)
  #  singles[num_millions.to_s] + " million"
  #end

  #def billions_number(num_billions)
  #  singles[num_billions.to_s] + " billion"
  #end

  def in_words_less_than_100
    if self <= 9
      singles[self.to_s]
    elsif self <= 12
      preteens[self.to_s]
    elsif self <= 19
      teens[self.to_s]
    elsif self < 100
      singles_part = self % 10 != 0 ? " " + singles[(self % 10).to_s] : ""
      #puts "(self / 10).to_s" + (self / 10).to_s
      tens_part = tens[(self / 10).to_s+"0"]
      tens_part + singles_part
    end
  end

  def preteens
    { "10" => 'ten',
      "11" => 'eleven',
      "12" => 'twelve',
    }
  end

  def teens
    { "13" => 'thirteen',
      "14" => 'fourteen',
      "15" => 'fifteen',
      "16" => 'sixteen',
      "17" => 'seventeen',
      "18" => 'eighteen',
      "19" => 'nineteen'}
  end

  def singles
    { "0" => 'zero',
      "1" => 'one',
      "2" => 'two',
      "3" => 'three',
      "4" => 'four',
      "5" => 'five',
      "6" => 'six',
      "7" => 'seven',
      "8" => 'eight',
      "9" => 'nine'}
  end

  def tens
    {
      "10" => 'ten',
      "20" => 'twenty',
      "30" => 'thirty',
      "40" => 'forty',
      "50" => 'fifty',
      "60" => 'sixty',
      "70" => 'seventy',
      "80" => 'eighty',
      "90" => 'ninety'}
  end

end

class Fixnum
  include InWords
end

class Bignum
  include InWords
end