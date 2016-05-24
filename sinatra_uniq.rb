require 'sinatra'
require_relative 'lib/uniqueness'

uniq_emails = 10.times.map { |i| "test#{i}@example.com" }
dup_emails = 100_000.times.flat_map { uniq_emails }

get '/' do
  "Size of original array: 1,000,000 \
  Size of unique array: #{unique_array(dup_emails).size} \
  Seconds taken: #{@end_time - @start_time}"
end

private

def unique_array(dup_emails)
  @start_time = Time.now
  emails = Uniqueness.unique(dup_emails)
  @end_time = Time.now
  emails
end
