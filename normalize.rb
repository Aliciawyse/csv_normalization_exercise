#!/usr/bin/ruby
require 'csv'
require 'time'

def replace_invalid_utf8(value_in_row)
    value_in_row.encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
end

def pad_zipcode(num)
    if num.to_s.length < 5
        while num.length < 5 do
            num = "0" + num.to_s
        end
        num
    else
        num
    end
end

input_data = $stdin.read.dup.force_encoding(Encoding::BINARY)

raw_csv = CSV.parse(input_data, {headers: true})

utf8_csv = CSV.generate do |csv|
    csv << raw_csv.headers

    raw_csv.each do |row|
        timestamp = Time.strptime(replace_invalid_utf8(row["Timestamp"]), '%m/%d/%y %I:%M:%S').iso8601
        address = replace_invalid_utf8(row["Address"])
        zipcode = pad_zipcode(row["ZIP"])
        fullname = replace_invalid_utf8(row["FullName"]).upcase
        foo_duration = row["FooDuration"].split(':').map { |a| a.to_i }.inject(0) { |a, b| a * 60 + b}
        bar_duration = row["BarDuration"].split(':').map { |a| a.to_i }.inject(0) { |a, b| a * 60 + b}
        total_diration = row["TotalDuration"] = foo_duration + bar_duration
        notes = row["Notes"]
        csv << [timestamp, address, zipcode, fullname, foo_duration, bar_duration, total_diration, notes]
    end
end

puts utf8_csv