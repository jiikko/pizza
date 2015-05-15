Operation.destroy_all

%i(Ruby CommonLisp).each do |x|
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

s = Scenario.create(name: "あばっば")
s.operations << op
s.operations << op
