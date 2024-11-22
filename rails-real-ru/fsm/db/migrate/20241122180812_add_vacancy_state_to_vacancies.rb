class AddVacancyStateToVacancies < ActiveRecord::Migration[7.2]
  def change
    add_column :vacancies, :vacancy_state, :string
  end
end
