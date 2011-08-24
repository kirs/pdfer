class CustomersMailer < ActionMailer::Base
  default :from => "iempire@yandex.ru"
  
  def report_email(pdf_output, to)
    report_filename = Time.zone.now.strftime('Report %d-%m-%Y')
    attachments[report_filename] = {
      :mime_type => 'application/pdf',
      :content => pdf_output
    }
    mail(:to => to, :subject => report_filename.titleize)
  end
  
end
