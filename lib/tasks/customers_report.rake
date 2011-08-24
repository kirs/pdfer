namespace :customers_report do
  desc 'Generates report with customers'
  task :generate_pdf => :environment do
    output = CustomersReport.new.to_pdf
    filename = "report.pdf"
    File.open(Rails.root.join('public', filename), 'wb') do |f|
      f.write(output)
    end
    puts "Report was written to #{filename}"
  end
  
  desc 'Send report by email'
  task :send_by_email => :environment do
    # можно указывать массивом
    # recipient = ["vasya@gmail.com", "petya@gmail.com"]
    recipient = 'razor.psp@gmail.com'
    output = CustomersReport.new.to_pdf
    CustomersMailer.report_email(output, recipient).deliver
    puts "Report was sent to #{recipient}"
  end
end