json.array!(@shifts) do |shift|
  json.extract! shift, :id
  json.title shift.user.first_name
  json.start shift.start_time
  json.end shift.end_time
  json.url shift_url(shift, format: :html)
end