Operation.destroy_all

%i(Ruby JavaScript CommonLisp).each do |x|
  ProgramingLanguage.create!(name: x)
end

op = Operation.new(name: "ヤフーで検索する")
op.tag_list = "テスト, ジャバスクリプトだ, そういうやつ"
op.programs.build(programing_language_id: 1)
program = op.programs.build(programing_language_id: 2)
op.target_url = "http://www.yahoo.co.jp/"
program.code = <<-CODE
$("#srchtxt").val("サザエさん");
$("#srchbtn").click();
CODE
op.save

op = Operation.new(name: "花粉症なの? ")
op.tag_list = "ラッパー, ジャバスクリプトだ, ネコ"
op.programs.build(programing_language_id: 1)
op.programs.build(programing_language_id: 3)
op.save

op = Operation.new(name: "ジャイアニズム ")
op.tag_list = "ただひとつだけのやつ, BBA"
op.programs.build(programing_language_id: 1)
op.programs.build(programing_language_id: 3)
op.save

10.times do
  op = Operation.new(name: "誰 ")
  op.tag_list = "ラッパー, ジャバスクリプトだ, ネコ"
  op.programs.build(programing_language_id: 1)
  op.save
end

s = Scenario.create(name: "あばっば")
s.operations << op
s.operations << op
