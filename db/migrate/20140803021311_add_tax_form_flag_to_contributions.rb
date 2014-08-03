class AddTaxFormFlagToContributions < ActiveRecord::Migration
  def change
    add_column :contributions, :tax_form_flag, :boolean
  end
end
