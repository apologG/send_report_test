require_relative 'lib/report'
require_relative 'lib/mailer'

income_data = [
  { code: 'A-001', guest: 'guest@email.com', entity: 'reservation', type: 'modified', created_at: '2019-06-08 23:40:02'},
  { code: 'A-001', guest: 'guest@email.com', entity: 'reservation', type: 'confirmed', created_at: '2019-06-08 22:06:45'}
]

report = 
      if (income_data.class == Array) && income_data.any? && income_data.all?(Hash) 
        Report.new(income_data)
       else 
        return nil
      end

unless report.nil?
	report.sort_by_date_asc!
	body = report.prepare_report_body

	Mailer.deliver(
		from: 'system@email.com',
		to: 'host@email.com',
		subject: 'Report',
		report: body
		# body: report #! тут точно аргумент body? в классе определен report 
	)
end
