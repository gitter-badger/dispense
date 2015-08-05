#
# $Id: create-slinks.rb 75 2009-06-14 23:30:37Z nicb $
#

YAMAHA_TABLE_FILENAME = File.dirname(__FILE__) + '/../yamaha-c5.table'

class YamahaMap
  attr_reader :soundin_number, :note_name, :dynamics, :real_filename

  def initialize(sn, nn, d)
    @soundin_number = sn
    @note_name = nn
    @dynamics = d
    @real_filename = calculate_real_filename
  end

  def soundin_name
    return 'soundin.' + soundin_number
  end

private

  def calculate_real_filename
    rf = 'c5-' + note_name.sub(/#/, '') + dynamics + '.wav'
  end

end

def read_map_table
  result = []
  fh = File.open(YAMAHA_TABLE_FILENAME, 'r')
  while line = fh.gets
    (sn, nn, d) = line.chomp.split(':')
    result << YamahaMap.new(sn, nn, d)
  end
  return result
end

def create_links(results)
  results.each do
    |ym|
    puts("ln -s #{ym.real_filename} soundin.#{ym.soundin_number}")
    File.symlink(ym.real_filename, ym.soundin_name)
  end
end

results = read_map_table
create_links(results)
