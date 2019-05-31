Time::DATE_FORMATS[:display_date] = '%B %d, %Y'
Time::DATE_FORMATS[:short_ordinal] = lambda { |time| time.strftime("%B #{time.day.ordinalize} %Y") }
