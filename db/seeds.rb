# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Preset.destroy_all
Comment.destroy_all
Rating.destroy_all

u1 = User.create email: 'test1@test.com', password: 'test'
u2 = User.create email: 'test2@test.com', password: 'test'
u3 = User.create email: 'test3@test.com', password: 'test'
u4 = User.create email: 'test4@test.com', password: 'test'

p1 = Preset.create name: 'test1', color_1: '#23ff98', color_2: '#c610ff', color_3: '#ff10a2', color_4: '#fe10a2',bg_color:"#111111", seeds: 250, angle:90, opacity: 100, zoom:15, b1:100, b2:10, b3:10, b4:100, b5:50,x:2,y:2

p2 = Preset.create name: 'test2', color_1: '#23ff98', color_2: '#c610ff', color_3: '#ff10a2', color_4: '#fe10a2',bg_color:"#111111", seeds: 250, angle:90, opacity: 100, zoom:15, b1:100, b2:10, b3:10, b4:100, b5:50,x:2,y:2
p3 = Preset.create name: 'test3', color_1: '#23ff98', color_2: '#c610ff', color_3: '#ff10a2', color_4: '#fe10a2',bg_color:"#111111", seeds: 250, angle:90, opacity: 100, zoom:15, b1:100, b2:10, b3:10, b4:100, b5:50,x:2,y:2
p4 = Preset.create name: 'test4', color_1: '#23ff98', color_2: '#c610ff', color_3: '#ff10a2', color_4: '#fe10a2',bg_color:"#111111", seeds: 250, angle:90, opacity: 100, zoom:15, b1:100, b2:10, b3:10, b4:100, b5:50,x:2,y:2
p5 = Preset.create name: 'test5', color_1: '#23ff98', color_2: '#c610ff', color_3: '#ff10a2', color_4: '#fe10a2',bg_color:"#111111", seeds: 250, angle:90, opacity: 100, zoom:15, b1:100, b2:10, b3:10, b4:100, b5:50,x:2,y:2
p6 = Preset.create name: 'test6', color_1: '#23ff98', color_2: '#c610ff', color_3: '#ff10a2', color_4: '#fe10a2',bg_color:"#111111", seeds: 250, angle:90, opacity: 100, zoom:15, b1:100, b2:10, b3:10, b4:100, b5:50,x:2,y:2
p7 = Preset.create name: 'test7', color_1: '#23ff98', color_2: '#c610ff', color_3: '#ff10a2', color_4: '#fe10a2',bg_color:"#111111", seeds: 250, angle:90, opacity: 100, zoom:15, b1:100, b2:10, b3:10, b4:100, b5:50,x:2,y:2
p8 = Preset.create name: 'test8', color_1: '#23ff98', color_2: '#c610ff', color_3: '#ff10a2', color_4: '#fe10a2',bg_color:"#111111", seeds: 250, angle:90, opacity: 100, zoom:15, b1:100, b2:10, b3:10, b4:100, b5:50,x:2,y:2

c1 = Comment.create comment: 'this is a comment, c1 this is a comment, this is a comment, '
c2 = Comment.create comment: 'this is a comment, c2 this is a comment, this is a comment,'
c3 = Comment.create comment: 'this is a comment, c2 this is a comment, this is a comment,'
# c4 = Comment.create comment: 'this is a comment, c2 this is a comment, this is a comment,'
# c5 = Comment.create comment: 'this is a comment, c2 this is a comment, this is a comment,'
# c6 = Comment.create comment: 'this is a comment, c2 this is a comment, this is a comment,'
# c7 = Comment.create comment: 'this is a comment, c2 this is a comment, this is a comment,'


r1 = Rating.create rating: 5
r2 = Rating.create rating: 4
r3 = Rating.create rating: 3
r4 = Rating.create rating: 3
r5 = Rating.create rating: 2
r6 = Rating.create rating: 1
r7 = Rating.create rating: 4
r8 = Rating.create rating: 0
r9 = Rating.create rating: 5
r10 = Rating.create rating: 5
r11 = Rating.create rating: 4
r12 = Rating.create rating: 3
r13 = Rating.create rating: 4
r14 = Rating.create rating: 5
r15 = Rating.create rating: 5
r16 = Rating.create rating: 3
r17 = Rating.create rating: 5
r18 = Rating.create rating: 4
r19 = Rating.create rating: 3
r20 = Rating.create rating: 4
r21 = Rating.create rating: 5
r22 = Rating.create rating: 5
r23 = Rating.create rating: 3

u1.presets << p1 << p2
u2.presets << p3 << p4
u3.presets << p5 << p6
u4.presets << p7 << p8

u1.comments << c1
u2.comments << c2
u3.comments << c3

p8.comments << c1 << c2 << c3

p1.ratings << r1 << r2
p2.ratings << r3 << r4 << r5
p3.ratings << r6 << r7 << r8
p4.ratings << r9 << r10 << r11
p5.ratings << r12 << r13 << r14
p6.ratings << r15 << r16
p7.ratings << r17 << r18 << r19
p8.ratings << r20 << r21 << r22 << r23

