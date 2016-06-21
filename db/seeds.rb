# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def report(res)
  if res
    print '.'
  else
    print 'x'
  end
end

User.create(email: 'oleg.bovykin@gmail.com', password: '111222333', name: 'Oleg Bovykin', roles: ['admin'])

brands = [
  { title: 'Eachine', site: 'eachine', remote_logo_url: '' },
  { title: 'Dys', site: 'http://www.dys.hk', remote_logo_url: '' },
  { title: 'Emax', site: 'emax', remote_logo_url: '' },
  { title: 'Diatone', site: 'diatone', remote_logo_url: '' },
  { title: 'Hobbywing', site: 'hw', remote_logo_url: '' },
  { title: 'Favourite', site: 'lb', remote_logo_url: '' },
  { title: 'Flyduino', site: 'fd', remote_logo_url: '' },
  { title: 'Boscam', site: 'bos', remote_logo_url: '' },
  { title: 'Fatshark', site: 'fatchark', remote_logo_url: '' },
  { title: 'ImmercionRC', site: 'immercion', remote_logo_url: '' },
  { title: 'Matek', site: 'matek', remote_logo_url: '' },
  { title: 'Noname', site: '', remote_logo_url: '' }
]

brands.each do |bp|
  b = Brand.find_or_initialize_by(title: bp[:title])
  b.assign_attributes(bp)
  report b.save
end
