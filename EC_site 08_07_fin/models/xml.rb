require 'open-uri'
require 'openssl'
require 'kconv'
require 'rexml/document'
class XmlOpen
  def xml_set(n)
    urls='https://shopping.yahooapis.jp/ShoppingWebService/V1/itemLookup?appid=dj00aiZpPXhmbWhQR2h2WkZRRCZzPWNvbnN1bWVyc2VjcmV0Jng9ZjI-&itemcode=hmv_2737935&responsegroup=large&itemcode='
    doc=REXML::Document.new(open(urls+n, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).read.toutf8)
    names=doc.elements['ResultSet/Result/Hit/Name'].text
    price=doc.elements['ResultSet/Result/Hit/PriceLabel/DefaultPrice'].text
    images=doc.elements['ResultSet/Result/Hit/Image/Medium'].text
    return [names,price,images]
  end
end
