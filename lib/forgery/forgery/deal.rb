class Forgery::Deal < Forgery
  def self.title
    dictionaries[:deal_titles].random
  end

  def self.side_deal_title
    dictionaries[:deal_side_deal_titles].random
  end

  def self.sub_title
    dictionaries[:deal_sub_titles].random
  end

  def self.deal_image
    assets[:deal_images].random
  end

  def self.side_deal_image
    assets[:side_deal_images].random
  end
end
