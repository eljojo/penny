require "penny/version"
require "excon"
require "nokogiri"

module Penny
  class Board < Struct.new(:name, :url, :price, :image, :available)
    alias_method :available?, :available
  end

  class Boards
    def initialize(shop)
      @shop_url = shop
    end

    def all
      parse_html(get_html)
    end

    def get_html
      Excon.get(@shop_url).body
    end

    def parse_html(html)
      doc = Nokogiri::HTML(html)
      doc.css(".item").map do |item|
        Board.new(
          item.at_css(".item__title").text.strip,
          item.at_css(".item__title a")["href"],
          item.at_css(".item__price").text.strip[1..-1].to_f,
          item.at_css(".item__img img")["src"],
          !item.at_css(".out-of-stock"),
        )
      end
    end
  end
end
