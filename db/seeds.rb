# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Operation.destroy_all

op = Operation.new(name: "すごいよ")
op.tag_list = "テスト, ジャバスクリプトだ, そういうやつ"
op.save

op = Operation.new(name: "花粉症なの? ")
op.tag_list = "ラッパー, ジャバスクリプトだ, ネコ"
op.save

op = Operation.new(name: "ジャイアニズム ")
op.tag_list = "ただひとつだけのやつ, BBA"
op.save

10.times do
  op = Operation.new(name: "誰 ")
  op.tag_list = "ラッパー, ジャバスクリプトだ, ネコ"
  op.save
end

s = Scenario.create(name: "あばっば")
s.operations << op
s.operations << op
