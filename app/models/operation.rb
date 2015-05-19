class Operation < ActiveRecord::Base
  acts_as_taggable_on :tags

  has_many :programs
  has_many :scenario_operations
  has_many :scenarios, through: :scenario_operations
  has_many :automations

  accepts_nested_attributes_for :programs, allow_destroy: true

  # 配列の場合スペースでhoinされるので
  def tag_list
    super.join(', ')
  end

  def programing_languages
    programs.map { |x| x.programing_language.name }.join(", ")
  end

  def find_program_by_programing_language(name: 'Ruby')
    programs.
    joins(:programing_language).
    find_by(
      programing_languages: { name: name }
    )
  end
end
