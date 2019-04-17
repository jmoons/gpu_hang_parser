# NOTE - this is expecting already grep-extraced messages based on 'Detected GPU Hang in dmesg' 
# Group 1: Server Time
# Group 2: Customer
# Group 3: Player ID
# Group 4: Player Time
# ^[\w\W]+ I, \W(\d+-\d+-\d+T\d+:\d+:\d+)[\W\d]+[\w\W]+ !!! (\w+) Player ID: (\d+) [\w\W]+ Player Time: (\d+-\d+-\d+T\d+:\d+:\d+)[\w\W]+

REGULAR_EXPRESSION = /^[\w\W]+ I, \W(\d+-\d+-\d+T\d+:\d+:\d+)[\W\d]+[\w\W]+ !!! (\w+) Player ID: (\d+) [\w\W]+ Player Time: (\d+-\d+-\d+T\d+:\d+:\d+)[\w\W]+/
SERVER_TIME_INDEX  = 1
CUSTOMER_INDEX     = 2
PLAYER_ID_INDEX    = 3
PLAYER_TIME_INDEX  = 4


File.open("grep_output").readlines.each do |line|

  parsed_line = REGULAR_EXPRESSION.match( line.chomp )

  puts "#{parsed_line[SERVER_TIME_INDEX]},#{parsed_line[PLAYER_ID_INDEX]},#{parsed_line[PLAYER_TIME_INDEX]},#{parsed_line[CUSTOMER_INDEX]}"

end