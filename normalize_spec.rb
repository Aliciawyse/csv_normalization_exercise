require 'rspec'


def replace_invalid_utf8(value_in_row)
    value_in_row.encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
end

describe 'replace_invalid_utf8' do
    it 'removes my characters that are not valid utf-8' do
        string_from_csv_row = "hello 株式会社スタジオジブリ"
        replace_invalid_utf8(string_from_csv_row).should eq "hello "
    end
end