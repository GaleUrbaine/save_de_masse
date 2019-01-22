

class Scrapping
  @@all_infos = []

  def initialize(city_name, city_email)
    @url_name = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    @url_email = Nokogiri::HTML(open("http://annuaire-des-mairies.com/"+ mail))
    @names = city_name
    @emails = city_email
    @@all_infos << @names + "=>" + @emails
  end

  def extract_names
    @names = []
    @url_name =
  end

  def self.all
    return @@all_infos
  end
end
