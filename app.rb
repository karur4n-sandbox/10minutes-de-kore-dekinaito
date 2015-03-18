class Cards
  # @param card_chars カードの元となる文字列 exp: 0123456789abcd
  def initialize(card_chars)
    @cards = card_chars.chars.map.to_a
  end

  # @param count 分割数
  # @return separate_array exp: [[1, 2, 3], [4, 5, 6]]
  def separate(count)
    count = count.to_i
    cards = order(count)
    cards.each_slice(count).to_a
  end

  # @param count 並べる組数
  # @return ordered_arry
  def order(count)
    count = count.to_i
    ordered_arry = Array.new(count) { [] }
    @cards.each_with_index do |card, i|
      ordered_arry[i % count] << card
    end

    ordered_arry
  end
end

argv = ARGV

card_chars = argv.shift
count = argv.shift

cards = Cards.new(card_chars)
cards = cards.separate(count)
p cards
