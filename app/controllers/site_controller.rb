class SiteController < ApplicationController
  def index
    output = CustomersReport.new.to_pdf
    send_data output, :filename => "hello.pdf", :type => "application/pdf"
  end

end
