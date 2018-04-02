# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Preset.destroy_all
u1 = User.create email: 'test1@test.com', password: 'test'
u2 = User.create email: 'test2@test.com', password: 'test'

p1 = Preset.create name: 'test1'
p2 = Preset.create name: 'test2'

u1.presets << p1
u2.presets << p2