require 'bundler'
Bundler.require

class User
  
    def names_townhall
        doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
        names = []
      doc.css('a.lientxt').each do |s|
        names << s.content
      end
      return names
    end

    def get_townhall_email
        towns_emails = []
        get_townhall_url.each do |mail|
          base = Nokogiri::HTML(open("http://annuaire-des-mairies.com/"+ mail))
          emails = base.xpath('//*/section[2]/div/table/tbody//tr[4]/td[2]')
          towns_emails << emails.text
        end
        return towns_emails
    end

    def all_infos
        emails_names = []
        emails_names = names_townhall.zip(get_townhall_email)
        puts emails_names
        total = []
        emails_names.each { |record| total << {record[0] => record[1]} }
        return total
    end

    def get_townhall_url
        doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
        url = []
          doc.css('//body//p/a[contains(html)]/@href').each do |c|
            url << c.content[1..-1]
          end
        return url
    end

    def perform
        names_townhall
        get_townhall_email
        all_infos
    end

end
