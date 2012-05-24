#!/usr/bin/env ruby

require 'date'

MONTHNAMES = [
   "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho",
   "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"
]


IO.foreach(ARGV[0]) do |line|

   #Skip header and footer
   next unless line =~ /^PS22/

   nib = line[9...30]
   #remove leading zeros and set 2 decimal places
   amount = sprintf "%.2f", (line[30...43].to_f / 100)
   desc = "Vencimento de #{MONTHNAMES[Date.today.mon - 1]}"

   printf "%s\t%s\t%s\n", nib, amount, desc

end
