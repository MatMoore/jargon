require 'csv'
require 'json'
require 'cgi'

DATA_FILES = %w(
    data/artefacts.csv
    data/grades.csv
    data/incantations.csv
    data/organisation-types.csv
    data/organisations.csv
    data/roles.csv
    data/uncategorised.csv
)

BUILD_DIR = 'build/'

CURIES = {
    "company" => "https://beta.companieshouse.gov.uk/company/{rel}",
    "government-organisation" => "https://government-organisation.register.gov.uk/records/{rel}"
}

def all_curies
    {
        "curies" => CURIES.map { |k, v| {name: k, href: v, templated: true} }
    }
end

def curies_in_use(records)
    result = CURIES.select {|k, v| records.any? {|record| record["uri"] && record["uri"].split(':').first == k}}
    result.map { |k, v| {name: k, href: v, templated: true} }
end

def combined_data
    [].tap do |result|
        DATA_FILES.each do |filename|
            CSV.foreach(filename, headers: true) do |row|
                result << row
            end
        end
    end
end

class Record
    attr_reader :row

    def initialize(row)
        @row = row
    end

    def acronym
        row["acronym"].upcase
    end

    def to_h
        row.to_h.tap { |hash| hash.delete("acronym") }
    end
end

class APIWriter
    def write_index(collection)
        IO.write(File.join(BUILD_DIR, 'index.json'), collection + "\n")
    end

    def write_item(item, acronym)
        dirname = CGI.escape(acronym)
        Dir.mkdir(File.join(BUILD_DIR, dirname))
        IO.write(File.join(BUILD_DIR, dirname, 'index.json'), item + "\n")
    end
end

writer = APIWriter.new
data = combined_data.map { |row| Record.new(row) }.sort_by(&:acronym).group_by(&:acronym)
data.transform_values! { |records| records.map(&:to_h) }

collection = data.dup
collection["_links"] = all_curies

writer.write_index(JSON.pretty_generate(collection))
data.each do |key, records|
    item = {
        key => records
    }
    curies = curies_in_use(records)
    item["_links"] = curies if curies.size > 0
    writer.write_item(JSON.pretty_generate(item), key)
end
